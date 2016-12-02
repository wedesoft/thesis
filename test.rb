#!/usr/bin/env ruby
require 'rubygems'
require 'matrix'
require 'linalg'
require 'hornetseye_rmagick'
require 'hornetseye_ffmpeg'
require 'hornetseye_xorg'
require 'hornetseye_v4l2'
include Linalg
include Hornetseye
class Matrix
  def to_dmatrix
    DMatrix[ *to_a ]
  end
  def svd
    to_dmatrix.svd.collect { |m| m.to_matrix }
  end
end
class Vector
  def norm
    Math.sqrt inner_product(self)
  end
  def normalise
    self * (1.0 / norm)
  end
  def reshape( *shape )
    Matrix[*MultiArray[*self].reshape(*shape).to_a]
  end
end
class DMatrix
  def to_matrix
    Matrix[ *to_a ]
  end
end
class Node
  def nms(threshold)
    self >= dilate.major(threshold)
  end
  def have(n, corners)
    hist = mask(corners).histogram max + 1
    msk = hist.eq n
    if msk.inject { |a,b| a.or b }
      id = lazy(msk.size) { |i| i }.mask(msk)[0]
      eq id
    else
      nil
    end
  end
  def abs2
    real * real + imag * imag
  end
  def largest
    hist = histogram max + 1
    msk = hist.eq hist.max
    id = lazy(msk.size) { |i| i }.mask(msk)[0]
    eq id
  end
  def otsu(hist_size = 256)
    hist = histogram hist_size
    idx = lazy(hist_size) { |i| i }
    w1 = hist.integral
    w2 = w1[w1.size - 1] - w1
    s1 = (hist * idx).integral
    s2 = to_int.sum - s1
    m1 = w1 > 0
    u1 = m1.conditional s1.to_sfloat / w1, 0
    m2 = w2 > 0
    u2 = m2.conditional s2.to_sfloat / w2, 0
    between_variance = (u1 - u2) ** 2 * w1 * w2
    max_between_variance = between_variance.max
    self > idx.mask(between_variance >= max_between_variance)[0]
  end
end
CORNERS = 0.3
W, H = 8, 5
N = W * H
SIZE = 21
GRID = 7
BOUNDARY = 19
SIZE2 = SIZE.div 2
f1, f2 = *(0 ... 2).collect do |k|
  finalise(SIZE,SIZE) do |i,j|
    a = Math::PI / 4.0 * k
    x = Math.cos(a) * (i - SIZE2) - Math.sin(a) * (j - SIZE2)
    y = Math.sin(a) * (i - SIZE2) + Math.cos(a) * (j - SIZE2)
    x * y * Math.exp( -(x**2+y**2) / 5.0 ** 2)
  end.normalise -1.0 / SIZE ** 2 .. 1.0 / SIZE ** 2
end
#input = V4L2Input.new
input = AVInput.new '/tmp/test.avi'
c = 0
#input = AVInput.new '/home/jan/Documents/work/phd/video/calibration2.avi'
#310.times { input.read }
#20.times { input.read }
#output = AVOutput.new '/tmp/test.avi', 4_000_000, 640, 480, 15
coords = finalise(input.width, input.height) { |i,j| i + Complex::I * j }
pattern = Sequence[*(([1] + [0] * (W - 2) + [1] + [0] * (H - 2)) * 2)]
X11Display.show do
puts c
  img = input.read_ubytergb
c += 1
  grey = img.to_ubyte
  corner_image = grey.convolve f1 + f2 * Complex::I
  abs2 = corner_image.abs2
  corners = abs2.nms CORNERS * abs2.max
  otsu = grey.otsu
  edges = otsu.dilate(GRID).and otsu.not.dilate(GRID)
  components = edges.components
  grid = components.have N, corners
  result = img
  if grid
    centre = coords.mask(grid.and(corners)).sum / N.to_f
    boundary = grid.not.components.largest.dilate BOUNDARY
    outer = grid.and(boundary).and corners
    vectors = (coords.mask(outer) - centre).to_a.sort_by { |c| c.arg }
    if vectors.size == pattern.size
      mask = Sequence[*(vectors * 2)].shift(vectors.size / 2).abs.nms(0.0)
      mask[0] = mask[mask.size-1] = false
      conv = lazy(mask.size) { |i| i }.mask(mask.to_ubyte.convolve(pattern.flip(0)).eq(4))
      if conv.size > 0
        offset = conv[0] - (pattern.size - 1) / 2
        rect = Sequence[*vectors].shift(-offset)[0 ... vectors.size].mask(pattern) + centre
        m = Sequence[Complex(0,0), Complex(W - 1, 0),
                     Complex(W - 1, H - 1), Complex(0, H - 1)]
        constraints = []
        for i in 0 ... 4 do
          constraints.push [ m[i].real, m[i].imag, 1.0, 0.0, 0.0, 0.0,
                  -rect[i].real * m[i].real, -rect[i].real * m[i].imag, -rect[i].real ]
          constraints.push [ 0.0, 0.0, 0.0, m[i].real, m[i].imag, 1.0,
                  -rect[i].imag * m[i].real, -rect[i].imag * m[i].imag, -rect[i].imag ]
        end
        h = Matrix[*constraints].svd[2].row(8).reshape(3, 3).inv
        x = coords.real * h[0,0] + coords.imag * h[0,1] + h[0,2]
        y = coords.real * h[1,0] + coords.imag * h[1,1] + h[1,2]
        l = coords.real * h[2,0] + coords.imag * h[2,1] + h[2,2]
        points = coords.mask grid.and(corners)
        sorted = (0 ... N).zip((x / l).warp(points.real, points.imag).to_a,
                               (y / l).warp(points.real, points.imag).to_a).
          sort_by { |a,b,c| [c.round,b.round] }.collect { |a,b,c| a }
        result = (x / l).between?(0, W - 1).and((y / l).between?(0, H - 1)).
          conditional img * RGB(0, 1, 0), img
        gc = Magick::Draw.new
        gc.fill_opacity(0).stroke('red').stroke_width 1
        for i in 0 ... N
          j = sorted[i]
          gc.circle points[j].real, points[j].imag, points[j].real + 2, points[j].imag
          gc.text points[j].real, points[j].imag, "#{i+1}"
        end
        result = result.to_ubytergb.to_magick
        gc.draw result
        result = result.to_ubytergb
      end
    end
  end
  #output.write result
  #output.write img
  result
end


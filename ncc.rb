#!/usr/bin/env ruby
require 'rubygems'
require 'hornetseye_fftw3'
require 'hornetseye_rmagick'
require 'hornetseye_xorg'
include Hornetseye
class Node
  def avg
    sum / size
  end
  def sqr
    self * self
  end
  def corr(other)
    (rfft * other.rfft.conj).irfft
  end
  def zcorr(other)
    zother = MultiArray.dfloat(*shape).fill!
    zother[0 ... other.shape[0], 0 ... other.shape[1]] = other
    corr zother
  end
  def ma(*box)
    iself = MultiArray.dfloat(*shape).fill!
    iself[1 ... shape[0], 1 ... shape[1]] = self[0 ... shape[0] - 1, 0 ... shape[1] - 1]
    int = iself.integral
    int[0 ... shape[0] - box[0], 0 ... shape[1] - box[1]] +
      int[box[0] ... shape[0], box[1] ... shape[1]] -
      int[0 ... shape[0] - box[0], box[1] ... shape[1]] -
      int[box[0] ... shape[0], 0 ... shape[1] - box[1]]
  end
  def ncc(other, noise)
    box = other.shape
    zcorr(other - other.avg)[0 ... shape[0] - box[0], 0 ... shape[1] - box[1]] /
      Math.sqrt((sqr.ma(*other.shape) -
                 ma(*other.shape).sqr / other.size) *
                (other - other.avg).sqr.sum + noise)
  end
end
syntax = <<END_OF_STRING
Locate template using normalised cross-correlation
Syntax : ncc.rb <image> <template>
Example: ncc.rb image.jpg template.jpg
END_OF_STRING
if ARGV.size != 2
  puts syntax
  raise "Wrong number of command-line arguments"
end
image = MultiArray.load_ubyte ARGV[0]
template = MultiArray.load_ubyte ARGV[1]
ncc = image.to_dfloat.ncc template.to_dfloat, 0.1
shiftx = lazy(*ncc.shape) { |i,j| i }.mask(ncc >= ncc.max)[0]
shifty = lazy(*ncc.shape) { |i,j| j }.mask(ncc >= ncc.max)[0]
result1 = image / 2
result2 = MultiArray.ubyte(*image.shape).fill!
result2[shiftx ... shiftx + template.shape[0],
        shifty ... shifty + template.shape[1]] = template / 2
(result1 + result2).show


#!/usr/bin/env ruby
require 'rubygems'
require 'multiarray'
require 'hornetseye_rmagick'
require 'hornetseye_xorg'
include Hornetseye
class Node
  def nms( threshold = 0 )
    finalise { dilate.major( threshold ) <= self }
  end
end
A_RANGE = 0 .. 179
THRESHOLD = 0x7F
img = MultiArray.load_ubyte 'http://www.wedesoft.demon.co.uk/hornetseye-api/images/lines.png'
img = 255 - img
diag = Math.sqrt( img.width ** 2 + img.height ** 2 )
d_range = -( diag + 1 ).div( 2 ) ... ( diag + 1 ).div( 2 )
binary = img <= THRESHOLD
x = lazy( *img.shape ) { |i,j| i - img.width  / 2 }.mask binary
y = lazy( *img.shape ) { |i,j| j - img.height / 2 }.mask binary
idx = lazy( A_RANGE.end + 1 ) { |i| i }
angle = lazy { Math::PI * idx / A_RANGE.end }
dist = lazy( d_range.end + 1 - d_range.begin ) { |i| i + d_range.begin }
cos, sin = lazy { |i| Math.cos( angle[ i ] ) }, lazy { |i| Math.sin( angle[ i ] ) }
a = lazy( angle.size, x.size ) { |i,j| i }
d = lazy { |i,j| ( x[j] * cos[i] + y[j] * sin[i] - d_range.begin ).to_int }
histogram = [ a, d ].histogram A_RANGE.end + 1, d_range.end + 1 - d_range.begin
( histogram ** 0.5 ).normalise( 255 .. 0 ).show
peaks = histogram.nms 40
#peaks.conditional( RGB( 255, 0, 0 ), histogram.normalise( 255 .. 0 ) ).show
a = lazy( d_range.end + 1 - d_range.begin ) { |j| angle }.mask peaks
d = lazy( A_RANGE.end + 1 ) { |i| dist }.roll.mask peaks
x = lazy { |i,j| ( Math.cos( a[j] ) * d[j] - Math.sin( a[j] ) * dist[i] + img.width  / 2 ).to_int }
y = lazy { |i,j| ( Math.sin( a[j] ) * d[j] + Math.cos( a[j] ) * dist[i] + img.height / 2 ).to_int }
m = lazy { ( x >= 0 ).and( x < img.shape[0] ).and( y >= 0 ).and( y < img.shape[1] ) }
( [ x.mask( m ), y.mask( m ) ].histogram( *img.shape ) > 0 ).conditional( RGB( 255, 0, 0 ), img ).show


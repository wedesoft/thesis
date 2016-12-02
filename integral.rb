#!/usr/bin/env ruby
require 'rubygems'
require 'hornetseye_rmagick'
include Hornetseye
img = MultiArray.load_ubytergb ARGV[0]
w, h = *img.shape; n = 9
int = img.to_intrgb.integral
int.normalise.save_ubytergb ARGV[1]
a = int[ n ...     w, n ...     h ]
b = int[ 0 ... w - n, n ...     h ]
c = int[ n ...     w, 0 ... h - n ]
d = int[ 0 ... w - n, 0 ... h - n ]
result = MultiArray.ubytergb( w, h ).fill! 255
result[ n / 2 ... w - n + n / 2, n / 2 ... h - n + n / 2 ] =
  ( ( a - b - c + d ) / n ** 2 )
result.save_ubytergb ARGV[2]


#!/usr/bin/env ruby
require 'rubygems'
require 'hornetseye_rmagick'
include Hornetseye
class Numeric
  def clip( range )
    [ [ self, range.begin ].max, range.end ].min
  end
end
colours = Sequence.ubytergb 256
for i in 0...256
  hue = 240 - i * 240.0 / 256.0
  colours[i] =
    RGB( ( ( hue - 180 ).abs -  60 ).clip( 0...60 ) * 0xFF / 60.0,
         ( 120 - ( hue - 120 ).abs ).clip( 0...60 ) * 0xFF / 60.0,
         ( 120 - ( hue - 240 ).abs ).clip( 0...60 ) * 0xFF / 60.0 )
end
MultiArray.load_ubyte( ARGV[0] ).lut( colours ).save_ubytergb ARGV[1]


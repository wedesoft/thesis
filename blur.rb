#!/usr/bin/env ruby
require 'rubygems'
require 'hornetseye_rmagick'
include Hornetseye
n = 15
ma_x = lazy( n, 1 ) { 1 }
ma_y = lazy( 1, n ) { 1 }
( MultiArray.load_ubytergb( ARGV[0] ).to_usintrgb.
  convolve( ma_x ).convolve( ma_y ) / n ** 2 ).save_ubytergb ARGV[1]


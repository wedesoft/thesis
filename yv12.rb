#!/usr/bin/env ruby
require 'rubygems'
require 'hornetseye_rmagick'
require 'hornetseye_frame'
include Hornetseye
MultiArray.load_ubytergb( ARGV[0] ).to_yv12.to_ubytergb.save_ubytergb ARGV[1]


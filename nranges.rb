#!/usr/bin/env ruby
require 'rubygems'
require 'benchmark'
require 'narray'
# env HORNETSEYE_PRELOAD_CACHE=YES ruby1.9 nranges.rb | tee ranges.txt
#  sed -e "s/.*byte(\([0-9]*\)).*(\([0-9 \\.]*\))/(\1,\2)/" ranges.txt
c = 100
Benchmark.bm( 32 ) do |x|
  for i in 1 .. 250
    s = i * 40000
    n = NArray.byte(s).indgen!
    GC.start
    x.report( "NArray.byte(#{s}).indgen! + 1" ) do
      c.times do
        n + 1
        #GC.start
      end
      #GC.start
    end
  end
end



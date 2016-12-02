#!/usr/bin/env ruby
require 'benchmark'
require 'narray'
w = 500
c = 1000
Benchmark.bm( 32 ) do |x|
  m = NArray.sfloat( w, w ).indgen!
  x.report( 'GC.start' ) do
    GC.start
  end
  x.report( 'm = NArray.sfloat(w,w).fill 1.0' ) do
    c.times { m = NArray.sfloat( w, w ).fill 1.0 }
    GC.start
  end
  x.report( 'm.fill 1.0' ) do
    c.times { m.fill 1.0 }
    GC.start
  end
  x.report( 'm + m' ) do
    c.times { m + m }
    GC.start
  end
  x.report( 'm * m' ) do
    c.times { m * m }
    GC.start
  end
  x.report( 'm + 1' ) do
    c.times { m + 1 }
    GC.start
  end
  x.report( 'm * 2' ) do
    c.times { m * 2 }
    GC.start
  end
  x.report( 'GC.start' ) do
    GC.start
  end
end

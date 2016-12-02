#!/usr/bin/env ruby
require 'rubygems'
require 'benchmark'
require 'multiarray'
include Hornetseye
# ruby1.9 breakdown.rb
N = 1_000_000
Benchmark.bm(32) do |x|
  c = 1000
  s = Sequence.ubyte N
  -s
  GC.start
  x.report( 'Ruby' ) do
    c.times { -s }
    GC.start
  end
  class Seq
    attr_reader :memory, :size
    def initialize(size)
      @memory = Malloc.new size
      @size = size
    end
    def inspect
      Sequence.import(UBYTE, @memory, @size).inspect
    end
    def -@
      retval = Seq.new @size
      GCCCache._Store0Lambda0Variable60INDEX0Variable20INT1112Lookup0Variable0050UBYTE112Variable60INDEX0Variable20INT1112Variable10INT1112490Lambda0Variable60INDEX0Variable50INT1112Lookup0Variable3050UBYTE112Variable60INDEX0Variable50INT1112Variable40INT11111 retval.memory, 1, retval.size, @memory, 1, @size
      retval
    end
  end
  s = Seq.new N
  GC.start
  x.report( 'optimised Ruby code' ) do
    c.times { -s }
    GC.start
  end
  system 'cp breakdown.c /tmp/hornetseye-ruby1.9.2-jan/breakdown.c'
  system 'gcc -shared -DNDEBUG  -O3 -ggdb -Wextra -Wno-unused-parameter -Wno-parentheses -Wpointer-arith -Wwrite-strings -Wno-missing-field-initializers -Wno-long-long  -fPIC -I/usr/local/include/ruby-1.9.1 -I/usr/local/include/ruby-1.9.1/x86_64-linux -o /tmp/hornetseye-ruby1.9.2-jan/breakdown.so /tmp/hornetseye-ruby1.9.2-jan/breakdown.c -L/usr/local/lib -Wl,-R -Wl,/usr/local/lib -L/usr/local/lib -lruby -L.  -rdynamic -Wl,-export-dynamic'
  require '/tmp/hornetseye-ruby1.9.2-jan/breakdown.so'
  GC.start
  x.report( 'optimised Ruby and C code' ) do
    c.times { -s }
    GC.start
  end
  GC.start
  x.report( 'allocation only' ) do
    c.times { Seq.new N }
    GC.start
  end
$retval = Seq.new N
  class Seq
    def -@
      GCCCache._Store0Lambda0Variable60INDEX0Variable20INT1112Lookup0Variable0050UBYTE112Variable60INDEX0Variable20INT1112Variable10INT1112490Lambda0Variable60INDEX0Variable50INT1112Lookup0Variable3050UBYTE112Variable60INDEX0Variable50INT1112Variable40INT11111 $retval.memory, 1, $retval.size, @memory, 1, @size
      $retval
    end
  end
  x.report( 'static memory layout' ) do
    c.times { -s }
    GC.start
  end
end


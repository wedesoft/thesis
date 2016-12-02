#!/usr/bin/env ruby
require 'rubygems'
require 'hornetseye_rmagick'
include Hornetseye
S = 2
N = 256 >> S
reference = MultiArray.load_ubytergb 'neon.png'
hist = ( reference >> S ).histogram( N, N, N ).convolve lazy( 5, 5, 5 ) { 1 }
hist = hist.normalise 0 .. 0.5
b = 0.5 + 0.5 / N
p1, p2, p3, r1, r2 = -N * 0.1, N * 1.1, N * 1.2, N * 0.01, N * 0.03
File.open( 'hist3d.pov', 'w' ) do |f|
  f << <<EOS
global_settings {
   ambient_light rgb < 1.0, 1.0, 1.0 >
   assumed_gamma 2.2
   max_trace_level 5
}
background { colour rgb < 1.0, 1.0, 1.0 > }
camera {
   location    < -3.1,  1.0, -1.4 >
   look_at     <  0,  -0.02,  0 >
   angle 33
}
light_source {
  < -3, 0.7, 1.6 >
  rgb < 1.0, 1.0, 1.0 >
}
box {
  < -#{b}, -#{b}, -#{b} >,
  <  #{b},  #{b},  #{b} >
  hollow
  texture {
    pigment { colour rgbt < 1.0, 1.0, 1.0, 0.9 > }
    finish {
      diffuse   0.1
      specular  0.4
      roughness 0.05
    }
  }
  interior {
    media {
      absorption 0.05
    }
  }
}
union {
  union {
    cylinder {
      < #{p1}, 0, 0 >,
      < #{p2}, 0, 0 >,
      #{r1}
    }
    cone {
      < #{p2}, 0, 0 >,
      #{r2},
      < #{p3}, 0, 0 >,
      0.0
    }
    pigment { colour rgb < 1, 0, 0 > }
    finish {
      ambient 0.5
      diffuse 0.5
    }
  }
  union {
    cylinder {
      < 0, #{p1}, 0 >,
      < 0, #{p2}, 0 >,
      #{r1}
    }
    cone {
      < 0, #{p2}, 0 >,
      #{r2},
      < 0, #{p3}, 0 >,
      0.0
    }
    pigment { colour rgb < 0, 1, 0 > }
    finish {
      ambient 0.5
      diffuse 0.5
    }
  }
  union {
    cylinder {
      < 0, 0, #{p1} >,
      < 0, 0, #{p2} >,
      #{r1}
    }
    cone {
      < 0, 0, #{p2} >,
      #{r2},
      < 0, 0, #{p3} >,
      0.0
    }
    pigment { colour rgb < 0, 0, 1 > }
    finish {
      ambient 0.5
      diffuse 0.5
    }
  }
EOS
  for z in 0 ... N
    for y in 0 ... N
      for x in 0 ... N
        if hist[ x, y, z ] > 0
          f << <<EOS
  sphere {
    < #{x}, #{y}, #{z} >, #{hist[ x, y, z ]}
    pigment { colour rgb < #{x.to_f/(N-1)}, #{y.to_f/(N-1)}, #{z.to_f/(N-1)} > }
    finish {
      ambient 0.85
      diffuse 0.3
    }
  }
EOS
        end
      end
    end
  end
f << <<EOS
  translate < -#{N/2}, -#{N/2}, -#{N/2} >
  rotate 180 * y
  scale #{1.0/N}
}
EOS
end

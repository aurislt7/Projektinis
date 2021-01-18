 #include "colors.inc"
  global_settings {
    assumed_gamma 2.2
    hf_gray_16
  }                      
  camera {
    location <0, 0, -10>
    look_at 0
  }
  plane { z, 10
    pigment {
        agate scale 0.6*8 + 7 turbulence 0.6*0.4 + 0.2
          color_map {
           [0 0.1*White]   
           [0.5 0.3*White] 
           [1 White]
          }
      } 
    }  
  
  light_source { <0, 20, -100> color White }
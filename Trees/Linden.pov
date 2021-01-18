                                             // POV-Ray 3.6 Scene File "Linden_01.pov"
// author: Friedrich A. Lohmueller, Oct-2013
// homepage: http://www.f-lohmueller.de
// demo file for POV-Tree  
//
// command line:  +w640 +h640   (quadratic)
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
#version 3.6; // 3.7
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
#declare Camera_Number = 1 ;
//---------------------------------------------------------------------------------
// camera -------------------------------------------------------------------------
#switch ( Camera_Number )
#case (0)
  #declare Camera_Location = < 0.00, 1.00, -5.50> ;  // front view
  #declare Camera_Look_At  = < 0.00, 2.00,  0.00> ;
  #declare Camera_Angle    =  45 ;
#break
#case (1)
  #declare Camera_Location =  < 2.0 , 2.5 ,-5.0> ;  // diagonal view
  #declare Camera_Look_At  =  < 0.0 , 1.0 , 0.0> ;
  #declare Camera_Angle    =  90 ;
#break
#case (2)
  #declare Camera_Location = < 3.0, 1.0 , 0.0> ;  // right side view
  #declare Camera_Look_At  = < 0.0, 1.0,  0.0> ;
  #declare Camera_Angle    =  90 ;
#break
#case (3)
  #declare Camera_Location = < 0.00, 5.00,  0+0.000> ;  // top view
  #declare Camera_Look_At  = < 0.00, 0.00,  0+0.001> ;
  #declare Camera_Angle    = 90 ;
#break
#else
  #declare Camera_Location = < 0.00, 1.00, -3.50> ;  // front view
  #declare Camera_Look_At  = < 0.00, 1.00,  0.00> ;
  #declare Camera_Angle    =  75 ;
#break
#break
#end // of "#switch ( Camera_Number )"  
//--------------------------------------------------------------------------
camera{ // ultra_wide_angle // orthographic 
        location Camera_Location
        right    x*image_width/image_height
        angle    Camera_Angle
        look_at  Camera_Look_At
      }
// sun ---------------------------------------------------------------------
light_source{< 1500,2500,-1500> color rgb<1,1,1>*0.8}                // sun 
light_source{ Camera_Location   color rgb<0.9,0.9,1>*0.2 shadowless}// flash

// sky ---------------------------------------------------------------------
// sky textures --------------------------------------------------------
#declare T_Clouds  =
texture {
    pigment { bozo
        turbulence 1.5
        octaves 10
        omega 0.5
        lambda 2.5
        color_map { [0.0 color rgbf<1, 1, 1, 1> ]
                    [0.2 color rgbf<0.85, 0.85, 0.85, 0.00>*1.5 ]
                    [0.5 color rgbf<0.95, 0.95, 0.95, 0.90>*1.12  ]
                    [0.6 color rgbf<1, 1, 1, 1> ]
                    [1.0 color rgbf<1, 1, 1, 1> ] }
    }

    finish {ambient 0.95 diffuse 0.1}
}

//--------------------------------------------------------------------
union { // make sky planes: 

 plane { <0,1,0>, 500 hollow //!!!!
        texture { bozo scale 1
                  texture_map{ 
                       [ 0.0  T_Clouds ]
                       [ 0.5  T_Clouds ]
                       [ 0.6  pigment{color rgbf<1,1,1,1> }] 
                       [ 1.0  pigment{color rgbf<1,1,1,1> }] 
                      } 
                       scale <500,1,1000>} translate<-400,0,300> } 

 plane { <0,1,0> , 10000  hollow
        texture{ pigment {color rgb<0.24,0.38,0.7>*0.50}
                 finish {ambient 1 diffuse 0}}}
scale<1.5,1,1.25>  
rotate<0,0,0> translate<0,0,0>}                          // end of sky
//--------------------------------------------------------------------


// fog on the ground -------------------------------------------------
fog { fog_type   2
      distance   250
      color      White*0.75
      fog_offset 0.1
      fog_alt    10
      turbulence 1.8
    }                                                    // end of fog

// ground ------------------------------------------------------------
plane { <0,1,0>, 0 
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.45 }
                 normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
               } // end of texture
      } // end of plane                                   // end of ground
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------


//-----------------------------------------------------
#include "Linden2.inc"    
#include "povtree/TOMTREE-1.5.inc"        
#declare Tree_01 = object{TREE double_illuminate hollow}
#include "Linden.inc"     
#include "povtree/TOMTREE-1.5.inc" 
#declare Tree_02 = object{TREE double_illuminate hollow}                 

//-----------------------------------------------------

//-----------------------------------------------------
object{ Tree_01
        scale 4
        rotate< 0, 0, 0>
        translate< 0, 0.00, 0>
      }
object{ Tree_02
        scale 4
        rotate< 4, 5, 0>
        translate< 1, 0.00, 0>
      } //-------------------------------------------- 
//---------------------------------------------------- 
// -------- Placing the trees -------------

#declare Spacing=0.1;
#declare Cnt=0;
#declare Seed=seed(5);  

 #declare Terrain_Obj=
  height_field {
    function 500,500 {
      pigment {
        agate
        color_map {
          [0.0 color rgb 0.0]
          [0.3 color rgb 0.2]
          [0.7 color rgb 0.8]
          [1.0 color rgb 1.0]
        }
        warp { turbulence 0.01 }
        scale 5 
        translate <1.8, -6.7, 0>
     
        translate <3, 3, 0>
        scale 1/6
        
        translate -0.5*y    
        scale <1, -1, 1>
        translate 0.5*y
      } 
    }

    rotate -90*x
    scale <6, 6, -0.4>
    translate <-3, -3, 0>
  }       


#declare PosX=-3;

#while (PosX < 3)

  #declare PosY=-3;

  #while (PosY < 3)

    // trace function
    #declare Norm = <0, 0, 0>;
    #declare Start = <PosX+(rand(Seed)-0.5)*Spacing, PosY+(rand(Seed)-0.5)*Spacing, 1.0>;
    #declare Pos = trace (
                  Terrain_Obj,     // object to test
                  Start,           // starting point
                  -z,              // direction
                  Norm );          // normal
                                                  
                                                  
                                                 #debug concat(" Trees\n")

    #if (Norm.x != 0 | Norm.y != 0 | Norm.z != 0)   // if intersection is found, normal differs from 0
      #if ((vdot(Norm, z)>0.85) & (Pos.z < 0.25))
      // criteria for placing trees: not too steep and not too high
        object{ Tree_01
        scale 4
        rotate< 0, 0, 0>
        translate Pos
      }
        #declare Cnt=Cnt+1;
      #end
    #end

    #declare PosY=PosY+Spacing;

  #end

  #declare PosX=PosX+Spacing;
#end
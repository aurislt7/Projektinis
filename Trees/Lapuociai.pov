// POV-Ray 3.6 Scene File "Linden_01.pov"
// author: Aurelijus Kauneckis
//
// command line:  +w640 +h640   (quadratic)
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
#version 3.6; // 3.7
#declare Seed = seed(5);
global_settings{ assumed_gamma 1.0 ambient_light 0.1+rand(Seed)*0.8}
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
#include "sunpos.inc"
//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
#declare Camera_Number = 0 ;
#declare Season_Number = 3 ;
#declare Forest_Type = 1;           

#declare SUNKEN_TRUNK_COLOR=<0.4, 0.44, 0.3>;
#declare RAISED_TRUNK_COLOR=<0.5, 0.54, 0.4>;
#switch( Season_Number )
#case(0)
    #declare BOTTOM_COLOR_1=<0.3, 0.54, 0.18, 0.0, 0.0>; //Summer
    #declare BOTTOM_COLOR_2=<0.34, 0.53, 0.18, 0.0, 0.0>; //Summer
#break
#case(1)
    #declare BOTTOM_COLOR_1=<0.4,0.2,0.1,0,0>; //Autumn
    #declare BOTTOM_COLOR_2=<0.3,0.2,0.1,0,0>; //Autumn
#break
#case(2)
    #declare BOTTOM_COLOR_1=<1,1,1>*1.3; //Winter
    #declare BOTTOM_COLOR_2=<1,1,1>*1.3; //Winter
#break        
#case(3)
    #declare BOTTOM_COLOR_1=<0.62, 0.86, 0.48, 0.0, 0.0>; //Spring
    #declare BOTTOM_COLOR_2=<0.51, 0.75, 0.38, 0.0, 0.0>; //Spring
#break
#end

#declare TRUNK_RADIUS=20;

#declare Leaves_Texture_1 = 
         texture{ pigment{ color BOTTOM_COLOR_1 }   
                  normal { bumps 0.15 scale 0.05 }
                  finish { phong 1 reflection 0.00}
                } // end of texture 
        #declare Leaves_Texture_2 = 
         texture{ pigment{ color BOTTOM_COLOR_2 }   
                  normal { bumps 0.15 scale 0.05 }
                  finish { phong 0.2 reflection 0.00}
                } // end of texture 
  
#declare ground=
  height_field {
    function 500,500 {
      pigment {
        agate scale rand( Seed )*8 + 7 turbulence rand( Seed )*0.4 + 0.2
          color_map {
           [0 0.1*White]   
           [0.5 0.3*White] 
           [1 White]
          }
      } 
    }
    smooth    
    translate <-.5, -.5, -.5>
    scale <10, 5, 10>
  } 
//---------------------------------------------------------------------------------
// camera -------------------------------------------------------------------------
#switch ( Camera_Number )
#case (0)
  #declare Camera_Location = <0,0,0>;
  #declare Camera_Look_At = <0,0,0>;
  #while(abs(Camera_Location.x - Camera_Look_At.x) <= 3 | abs(Camera_Location.z - Camera_Look_At.z) <= 3)
  
      #declare Camera_Location = trace(ground, < -5+10* rand( Seed), 5, -5+10* rand( Seed)>, -y) + <0,0.4,0>;  
      #declare Camera_Look_At  = trace(ground, < 0, 5, 0>, -y) + <0,0.6,0> ;
  #end
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
  #declare Camera_Location = < 0.00, 20.00,  0+0.000> ;  // top view
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
                                                                             
                                                                                                               

camera{
        location Camera_Location
        right    x*image_width/image_height
        angle    Camera_Angle
        look_at  Camera_Look_At
      }
      
light_source{< 1500,2500, 0> color White parallel}                // sun 

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
 // end of texture
       // end of plane                                   // end of ground
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
                                              
#declare Stem_Texture =
texture{ pigment{ color <0.11, 0.0, 0>*0.1}
        normal{bumps 0.75 scale<0.025,0.075,0.025>}
         finish { phong 0.2 }
       } // end of texture 
#declare Plants_Texture = 
 texture{ pigment{ color BOTTOM_COLOR_1 }   
          normal { bumps 0.15 scale 0.05 }
          finish { phong 1 reflection 0.00}
        } // end of texture
#declare Autumn_Leaves_Texture_1 =
texture{ pigment{ bozo
                  color_map{
                  [0.0 color rgbf<1,0.1,0,0.2>*0.7]
                  [1.0 color rgbf<1,0.7,0, 0.2>]
                           } // color_map
                }  // pigment
         normal { bumps 0.15 scale 0.05 }
         finish { phong 1 reflection 0.00}
       } // end of texture
#declare Autumn_Leaves_Texture_2 =
texture{ pigment{ color rgbf<1,0.5,0.0,0.4>*0.5}
         normal { bumps 0.15 scale 0.05 }
         finish { phong 0.2 }
       } // end of texture
//-----------------------------------------------------      
#switch ( Forest_Type )
#case(0)
    //Add Birch
    #include "Trees/birch.inc"
    //----------------------
    /* Season Stuff */
    #switch ( Season_Number )
    #case(0)
        
    #break
    #case(1)
        #declare LEAVES=20*BUNCHES;
        #declare BOTTOM_COLOR_1=<0.4,0.2,0.1,0,0>;
        #declare BOTTOM_COLOR_2=<0.3,0.2,0.1,0,0>;
        #declare TOP_COLOR_1=<0.4, 0.3, 0.2, 0,0>;
        #declare TOP_COLOR_2=<0.4, 0.3, 0.2, 0,0>;    
    #break
    #case(2)
        #declare LEAVES=0*BUNCHES;
        #declare BOTTOM_COLOR_1=<0.4,0.2,0.1,0,0>;
        #declare BOTTOM_COLOR_2=<0.3,0.2,0.1,0,0>;
        #declare TOP_COLOR_1=<0.4, 0.3, 0.2, 0,0>;
        #declare TOP_COLOR_2=<0.4, 0.3, 0.2, 0,0>;
        #declare SUNKEN_TRUNK_COLOR=<1,1,1>*1.3;
        #declare RAISED_TRUNK_COLOR=<1,1,1>*1.3;
        #declare FOLIAGE_COLOR_AT_BRANCH_END=0;    
    #break 
    #case(3)
        #declare LEAVES=25*BUNCHES;
        #declare BOTTOM_COLOR_1=<0.62, 0.86, 0.48, 0.0, 0.0>;
        #declare BOTTOM_COLOR_2=<0.51, 0.75, 0.38, 0.0, 0.0>;
        #declare LEAF_LENGTH=20;
        #declare LEAF_BREADTH=15;
    #break
    #else
    
    #end    
    //----------------------
    #include "povtree/TOMTREE-1.5.inc"   
    #declare Birch = object{TREE double_illuminate hollow}
    #declare TRUNK_RADIUS=15;
    #include "povtree/TOMTREE-1.5.inc"
    #declare S_Birch = object{TREE double_illuminate hollow scale 0.7}
    
    #declare LEAVES=1*BUNCHES;
    #declare TRUNK_RADIUS=15;
    #declare LEAVES= 0;
    #declare TRUNK_RADIUS=rand(Seed)*15+15;
    #declare ROOTS=0;
    #declare BRANCHES=0;     
    #include "povtree/TOMTREE-1.5.inc" 
    #declare Birch_log = object{TREE double_illuminate hollow}
    #declare TRUNK_RADIUS=15;
    #declare BRANCHES=5; 
    #declare TWIGS=0;   
    #declare LEAVES= 0;
    #declare BUNCHES=0;
    #include "povtree/TOMTREE-1.5.inc"  
    #declare D_Birch = object{TREE double_illuminate hollow}
    
    //Add Linden
    #include "Trees/Linden/LEAF5.inc"
    //----------------------
    /* Season Stuff */
    #switch ( Season_Number )
    #case(0)
        
    #break
    #case(1)
        #declare LEAVES=20*BUNCHES;
        #declare BOTTOM_COLOR_1=<0.4,0.2,0.1,0,0>;
        #declare BOTTOM_COLOR_2=<0.3,0.2,0.1,0,0>;
        #declare TOP_COLOR_1=<0.4, 0.3, 0.2, 0,0>;
        #declare TOP_COLOR_2=<0.4, 0.3, 0.2, 0,0>;    
    #break
    #case(2)
        #declare LEAVES=0*BUNCHES;
        #declare BOTTOM_COLOR_1=<0.4,0.2,0.1,0,0>;
        #declare BOTTOM_COLOR_2=<0.3,0.2,0.1,0,0>;
        #declare TOP_COLOR_1=<0.4, 0.3, 0.2, 0,0>;
        #declare TOP_COLOR_2=<0.4, 0.3, 0.2, 0,0>;
        #declare SUNKEN_TRUNK_COLOR=<1,1,1>*1.3;
        #declare RAISED_TRUNK_COLOR=<1,1,1>*1.3;
        #declare FOLIAGE_COLOR_AT_BRANCH_END=0;
    #break  
    #case(3)
        #declare LEAVES=25*BUNCHES;
        #declare BOTTOM_COLOR_1=<0.62, 0.86, 0.48, 0.0, 0.0>;
        #declare BOTTOM_COLOR_2=<0.51, 0.75, 0.38, 0.0, 0.0>;
        #declare LEAF_LENGTH=20;
        #declare LEAF_BREADTH=15;
    #break
    #else
    
    #end    
    //----------------------     
    #include "povtree/TOMTREE-1.5.inc" 
    #declare Linden = object{TREE double_illuminate hollow }
    #declare TRUNK_RADIUS=15;
    #include "povtree/TOMTREE-1.5.inc"  
    #declare S_Linden = object{TREE double_illuminate hollow scale 0.7}
    #declare LEAVES= 0;
    #declare TRUNK_RADIUS=rand(Seed)*15+15;
    #declare ROOTS=0;
    #declare BRANCHES=0;     
    #include "povtree/TOMTREE-1.5.inc" 
    #declare Linden_log = object{TREE double_illuminate hollow}    
    #declare TRUNK_RADIUS=15;
    #declare LEAVES= 0;
    #declare BUNCHES=0;
    #declare BRANCHES=5;
    #declare TWIGS=0;
    #include "povtree/TOMTREE-1.5.inc"  
    #declare D_Linden = object{TREE double_illuminate hollow}
#break
#case(1)
    //Add Pine
    #include "Trees/european_larch.inc"
    #include "Trees/tamarack.inc"
    //----------------------
    /* Season Stuff */
    #switch ( Season_Number )
    #case(0)
        #declare BOTTOM_COLOR_1=<0.2, 0.3, 0.1, 0.0, 0.0>*0.2; //Summer
        #declare BOTTOM_COLOR_2=<0.2, 0.3, 0.1, 0.0, 0.0>*0.2; //Summer   
    #break
    #case(1)
        #declare BOTTOM_COLOR_1=<0.2, 0.3, 0.1, 0.0, 0.0>*0.3;
        #declare BOTTOM_COLOR_2=<0.2, 0.3, 0.1, 0.0, 0.0>*0.3;
        #declare TOP_COLOR_1=<0.4, 0.3, 0.2, 0,0>;
        #declare TOP_COLOR_2=<0.4, 0.3, 0.2, 0,0>;   
    #break
    #case(2)
        #declare BOTTOM_COLOR_1=<0.2, 0.3, 0.1, 0.0, 0.0>*0.2;
        #declare BOTTOM_COLOR_2=<0.2, 0.3, 0.1, 0.0, 0.0>*0.2;
        #declare TOP_COLOR_1=<0.4, 0.3, 0.2, 0,0>;
        #declare TOP_COLOR_2=<0.4, 0.3, 0.2, 0,0>;
        #declare SUNKEN_TRUNK_COLOR=<1,1,1>*1.3;
        #declare RAISED_TRUNK_COLOR=<1,1,1>*1.3;   
    #break
    #case(3)
        #declare BOTTOM_COLOR_1=<0.2, 0.44, 0.07, 0.0, 0.0>;
        #declare BOTTOM_COLOR_2=<0.3, 0.54, 0.18, 0.0, 0.0>;;
    #break
    #end
    
    #declare Leaves_Texture_1 = 
         texture{ pigment{ color BOTTOM_COLOR_1 }   
                  normal { bumps 0.15 scale 0.05 }
                  finish { phong 1 reflection 0.00}
                } // end of texture 
    #declare Leaves_Texture_2 = 
     texture{ pigment{ color BOTTOM_COLOR_2 }   
              normal { bumps 0.15 scale 0.05 }
              finish { phong 0.2 reflection 0.00}
            } // end of texture 
     
    //----------------------   
    #declare Linden = union{ object{ tamarack_13_stems
                   texture{ Stem_Texture }
                 } //---------------------
           object{ tamarack_13_leaves
                   double_illuminate
                   texture{ Leaves_Texture_1 }
                   interior_texture{ Leaves_Texture_2 }
                 } //---------------------
           rotate <0,90,0>
           scale 0.07
         }
    #declare D_Linden = object{ tamarack_13_stems
        texture{ Stem_Texture }
        scale 0.01
        rotate <0,45,0>
      } 
    #declare S_Linden = union{ object{ tamarack_13_stems
                   texture{ Stem_Texture }
                 } //---------------------
           object{ tamarack_13_leaves
                   double_illuminate
                   texture{ Leaves_Texture_1 }
                   interior_texture{ Leaves_Texture_2 }
                 } //---------------------
           rotate <0,90,0>
           scale 0.02
         }
    
     #include "Trees/Linden/LEAF.inc"
    //----------------------
    /* Season Stuff */
    #switch ( Season_Number )
    #case(0)
        #declare BOTTOM_COLOR_1=<0.3, 0.54, 0.18, 0.0, 0.0>*0.2; //Summer
        #declare BOTTOM_COLOR_2=<0.34, 0.53, 0.18, 0.0, 0.0>*0.2; //Summer
        #declare SUNKEN_TRUNK_COLOR=<0.11, 0.0, 0>*0.1;
        #declare RAISED_TRUNK_COLOR=<0.11, 0.0, 0>*0.1;
        #declare Leaves_Texture_1 = 
         texture{ pigment{ color BOTTOM_COLOR_1 }   
                  normal { bumps 0.15 scale 0.05 }
                  finish { phong 1 reflection 0.00}
                } // end of texture 
        #declare Leaves_Texture_2 = 
         texture{ pigment{ color BOTTOM_COLOR_2 }   
                  normal { bumps 0.15 scale 0.05 }
                  finish { phong 0.2 reflection 0.00}
                } // end of texture      
    #break
    #case(1)
        #declare BOTTOM_COLOR_1=<0.3, 0.54, 0.18, 0.0, 0.0>*0.2; //Summer
        #declare BOTTOM_COLOR_2=<0.34, 0.53, 0.18, 0.0, 0.0>*0.2; //Summer
        #declare TOP_COLOR_1=<0.4, 0.3, 0.2, 0,0>;
        #declare TOP_COLOR_2=<0.4, 0.3, 0.2, 0,0>;
        #declare SUNKEN_TRUNK_COLOR=<0.11, 0.0, 0>*0.1;
        #declare RAISED_TRUNK_COLOR=<0.11, 0.0, 0>*0.1;
        #declare Leaves_Texture_1 = 
         texture{ pigment{ color BOTTOM_COLOR_1 }   
                  normal { bumps 0.15 scale 0.05 }
                  finish { phong 1 reflection 0.00}
                } // end of texture 
        #declare Leaves_Texture_2 = 
         texture{ pigment{ color BOTTOM_COLOR_2 }   
                  normal { bumps 0.15 scale 0.05 }
                  finish { phong 0.2 reflection 0.00}
                } // end of texture    
    #break
    #case(2)
        #declare BOTTOM_COLOR_1=<0.3, 0.54, 0.18, 0.0, 0.0>*0.2; //Summer
        #declare BOTTOM_COLOR_2=<1,1,1>*1.3; //Summer
        #declare TOP_COLOR_1=<0.4, 0.3, 0.2, 0,0>;
        #declare TOP_COLOR_2=<0.4, 0.3, 0.2, 0,0>;
        #declare SUNKEN_TRUNK_COLOR=<1,1,1>*1.3;
        #declare RAISED_TRUNK_COLOR=<1,1,1>*1.3;
        #declare FOLIAGE_COLOR_AT_BRANCH_END=0;
        #declare Leaves_Texture_1 = 
         texture{ pigment{ color BOTTOM_COLOR_1 }   
                  normal { bumps 0.15 scale 0.05 }
                  finish { phong 1 reflection 0.00}
                } // end of texture 
        #declare Leaves_Texture_2 = 
         texture{ pigment{ color BOTTOM_COLOR_2 }   
                  normal { bumps 0.15 scale 0.05 }
                  finish { phong 0.2 reflection 0.00}
                } // end of texture    
    #break
    #case(3)
        #declare BOTTOM_COLOR_1=<0.62, 0.86, 0.48, 0.0, 0.0>*0.5;
        #declare BOTTOM_COLOR_2=<0.51, 0.75, 0.38, 0.0, 0.0>*0.5;
        #declare SUNKEN_TRUNK_COLOR=<0.11, 0.0, 0>*0.2;
        #declare RAISED_TRUNK_COLOR=<0.11, 0.0, 0>*0.2;
        #declare Leaves_Texture_1 =
        texture{ pigment{ color BOTTOM_COLOR_1 }   
                  normal { bumps 0.15 scale 0.05 }
                  finish { phong 1 reflection 0.00}
                } // end of texture 
        #declare Leaves_Texture_2 = 
         texture{ pigment{ color BOTTOM_COLOR_2 }   
                  normal { bumps 0.15 scale 0.05 }
                  finish { phong 0.2 reflection 0.00}
                } // end of texture
    #break
    #end    
    //----------------------       
    #declare LEAVES= 0;
    #declare TRUNK_RADIUS=rand(Seed)*15+15;
    #declare ROOTS=0;
    #declare BRANCHES=0;    
    #include "povtree/TOMTREE-1.5.inc" 
    #declare Linden_log = object{TREE double_illuminate hollow};
    #declare Birch_log = object{ Linden_log };  
    
    #declare Birch = union{ object{ tamarack_13_stems
                   texture{ Stem_Texture }
                 } //---------------------
           object{ european_larch_13_leaves
                   double_illuminate
                   texture{ Leaves_Texture_1 }
                   interior_texture{ Leaves_Texture_2 }
                 } //---------------------
           rotate <0,90,0>
           scale 0.05
         }
    #declare D_Birch = object{ tamarack_13_stems
        texture{ Stem_Texture }
        scale 0.01
        rotate <0,45,0>
      } 
    #declare S_Birch = union{ object{ tamarack_13_stems
                   texture{ Stem_Texture }
                 } //---------------------
           object{ tamarack_13_leaves
                   double_illuminate
                   texture{ Leaves_Texture_1 }
                   interior_texture{ Leaves_Texture_2 }
                 } //---------------------
           rotate <0,90,0>
           scale 0.02
         }      
#end


#declare Trees = array[3] {Birch, Linden, Linden};
#declare Small_trees = array[9] {S_Linden, S_Linden, S_Birch, S_Linden, S_Linden, S_Birch, D_Linden, D_Linden, S_Birch};
#declare Logs = array[3] {Birch_log, Linden_log, Linden_log}
/*#declare Small_trees = array[2] {D_Linden, S_Linden} ;
#declare Logs = array[1] {Linden_log} ;*/                

//-----------------------------------------------------  

#include "Trees/Plants/WHEAT.inc"    
#declare Plant_02 = union{ 
          object{ wheat_13_stems
                  texture{ Plants_Texture }
                } //------------------------
          object{ wheat_13_leaves  
                  double_illuminate
                  texture{ Plants_Texture }   
                  interior_texture{ Leaves_Texture_2 }   
                } //------------------------
      rotate <0,90,0>
      translate<0,0,0>
      scale 0.3
    }
#include "Trees/Plants/rush.inc"    
#declare Plant_03 = union{ 
          object{ rush_13_stems
                  texture{ Plants_Texture }
                } //------------------------
          object{ rush_13_leaves  
                  double_illuminate
                  texture{ Plants_Texture }   
                  interior_texture{ Leaves_Texture_2 }   
                } //------------------------
      rotate <0,90,0>
      translate<0,0,0>
      scale 0.5
    }
#include "Trees/Plants/shave_grass.inc"    
#declare Plant_04 = union{ 
          object{ shave_grass_13_stems
                  texture{ Plants_Texture }
                } //------------------------
          object{ shave_grass_13_leaves  
                  double_illuminate
                  texture{ Plants_Texture }   
                  interior_texture{ Plants_Texture }   
                } //------------------------
      rotate <0,90,0>
      translate<0,0,0>
      scale 0.5
    }
#include "Trees/Plants/test.inc"    
#declare Plant_05 = union{ 
          object{ rush_13_stems
                  texture{ Plants_Texture }
                } //------------------------
          object{ rush_13_leaves  
                  double_illuminate
                  texture{ Plants_Texture }   
                  interior_texture{ Plants_Texture }   
                } //------------------------
      rotate <0,90,0>
      translate<0,0,0>
      scale 0.5
    }  

#declare Plants = array[7] {Plant_02, Plant_02, Plant_03, Plant_05, Plant_05, Plant_05, Plant_04};  

//-----------------------------------------------------
#include "Trees/birch_roots.inc"
#declare LEAVES= 0;
#declare TRUNK_RADIUS=20;
#declare ROOTS=0;
#declare BRANCHES=0;     
#include "povtree/TOMTREE-1.5.inc" 
#declare b_roots = object{TREE double_illuminate hollow}
//-----------------------------------------------------
/*#declare My_Terrain=
texture{ pigment{ color rgb<0.35,0.65,0.0>*0.45 }
                 normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
              
}*/
#switch ( Season_Number )
#case (2) 
    #declare My_Terrain=
    texture{ pigment{ color rgb<1,1,1>*1.2}//0.35,0.65,0.0>*0.45 }
                 normal { bumps 0.75 scale 0.125  }
                 finish { phong 1
                          crand 0.25 }
               } // end of texture
#break
#else
    #declare My_Terrain=
    texture{ pigment{ color rgb<0.13,0.05,0.00>*0.7 }
                     normal { bumps 1 scale 2 }
                     finish {
                        ambient 0.2
                        //diffuse .1  
                        crand 0.8
                        //phong .01
                        specular 0.05
                        roughness 0.5
                    }
    }
#end                   

//-----------------------------------------------------   
object {
  ground
  texture { My_Terrain }
}//-------------------------------------------- 
//---------------------------------------------------- 
// -------- Placing the trees -------------

#declare Spacing=1.5;
#declare Cnt=0;
#if (Season_Number = 3)
    #declare plant_scale = 0.4;
#else
    #declare plant_scale = 0.5;
#end      



#declare PosX=-5;

#while (PosX < 5)

  #declare PosY=-5;

  #while (PosY < 5)
    // trace function
    //add trees
    #declare Norm = <1,1,1>;
    #declare Start = <PosX+(rand(Seed)), 10.0 , PosY+(rand(Seed))>;
    #declare Pos = trace (
                  ground,     // object to test
                  Start,           // starting point
                  -y,              // direction
                  Norm );          // normal

    #if (vlength(Norm)!=0 & abs(Pos.x - Camera_Location.x) > 2 & abs(Pos.z - Camera_Location.z) > 2)   // if intersection is found, normal differs from 0
        object{ Trees[int(rand(Seed)*dimension_size(Trees, 1)-0.1)]
        scale 2+rand(Seed)*3
        rotate< rand(Seed)*7, rand(Seed)*360, 0>
        translate Pos  
      }
    #end  
    //add fallen trees
    #declare Angle = rand(Seed)*360;
    #declare Norm2 = <0,0,0>;
    #declare R_Start = <PosX+(rand(Seed)*Spacing), 10.0 , PosY+(rand(Seed)*Spacing)>;
    #declare R2_Start = R_Start + <0, 0, 2>;
    #declare R_Pos = trace (
                  ground,     // object to test
                  R_Start,           // starting point
                  -y,              // direction
                  Norm );          // normal
    #declare R2_Pos = trace (
                  ground,     // object to test
                  R2_Start,           // starting point
                  -y,              // direction
                  Norm2 );          // normal                
    #if (vlength(Norm2)!=0 & vlength(Norm)!=0 & abs(R_Pos.x - Pos.x) > 0.1 & abs(R_Pos.z - Pos.z) > 0.1 & R2_Pos.y - R_Pos.y < 0.5 & R2_Pos.y-R_Pos.y > -0)   // if intersection is found, normal differs from 0
        object{ Logs[int(rand(Seed)*dimension_size(Logs, 1)-0.1)]
        scale 4
        rotate< 90, 0, 0>
        translate R_Pos
      }
    #end
    #if ( Season_Number != 2 )
    #for(i, 0, 400, 1)
        //add plants
        #declare P_Start = <PosX+(rand(Seed)*Spacing*2), 10.0 , PosY+(rand(Seed)*Spacing*2)>;
        #declare P_Pos = trace (
                  ground,     // object to test
                  P_Start,           // starting point
                  -y,              // direction
                  Norm );          // normal
        #if (vlength(Norm)!=0 & abs(P_Pos.x - Pos.x) > 0.1 & abs(P_Pos.z - Pos.z) > 0.1)   // if intersection is found, normal differs from 0
            object{ Plants[int(rand(Seed)*dimension_size(Plants, 1)-0.1)]
            scale rand(Seed)*0.5+plant_scale
            rotate< rand(Seed)*7, rand(Seed)*360, 0>
            translate P_Pos
        }
       #end    
   #end
   #end 
   //#if (rand(Seed) > 0.5)
      #declare S_Start = <PosX+(rand(Seed)*Spacing/2), 10.0 , PosY+(rand(Seed)*Spacing/2)>;
        #declare S_Pos = trace (
                  ground,     // object to test
                  S_Start,           // starting point
                  -y,              // direction
                  Norm );          // normal
        #if (vlength(Norm)!=0 & abs(S_Pos.x - Pos.x) > 0.1 & abs(S_Pos.z - Pos.z) > 0.1 & abs(S_Pos.x - Camera_Location.x) > 1 & abs(Camera_Location.z - Pos.z) > 1)   // if intersection is found, normal differs from 0
            object{ Small_trees[int(rand(Seed)*dimension_size(Small_trees, 1)-0.1)]
            scale 1+rand(Seed)*2
            rotate< rand(Seed)*7, rand(Seed)*360, 0>
            translate S_Pos /*- <0, rand(Seed)*0.7+0.3, 0>   */
        }  
        #end  
   //#end 

    #declare PosY=PosY+Spacing;     
  #end

  #declare PosX=PosX+Spacing;
#end
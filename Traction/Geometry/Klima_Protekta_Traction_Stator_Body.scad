// Klima_Protecta_Traction_Stator_Body
include<Klima_Protekta_Traction_Dimensions.scad>;


// approximate 3D Ink volume

volume = 

// approximate 3D Ink weight

// approximate 3D Ink costs


tin_diameter=214;
difference(){
union(){
    difference(){
        cylinder(120,tin_diameter/2, tin_diameter/2, $fn=50);
        translate([0,0,5])cylinder(120-3,(tin_diameter-32)/2, (tin_diameter-32)/2, $fn=50);
    }
    
    // feature: posts to support wires for electomagnetic cores
    for (magnet = [0:1:63]) {  // 64 magnets in a circle layed out on the X Y plain. 
        rotate(magnet*360/64, [0, 0, 1])translate([0,(tin_diameter-20)/2,0]){
            for(post = [1:1:4]){
                translate([0,0,post*12])rotate(90,[1,0,0])cylinder (12,3,3, $fn=50);
            }
        }
    }
    
    // feature: four posts to support Arduiono board
    
    // feature: four posts to support High Voltage Board

    
    
}
// feature: hole for power and information leads to come in
translate([0,tin_diameter/4,-1])cylinder (7,8,8, $fn=50);
}
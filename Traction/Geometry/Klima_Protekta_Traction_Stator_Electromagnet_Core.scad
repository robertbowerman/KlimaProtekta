// Klima_Protecta_Traction_Stator_Electromagnet_Core

// sits in Stator

include<Klima_Protekta_Traction_Dimensions.scad>;

cylinder(h=100, r=3, centre=true, $fn=50);

translate([-5,0,-13]) {
color("red") cube([10,5,13], centre=true); // main contact
        translate([0,0,-5]){
color("red") cube([10,13,5], centre=true); // end bearing
    }
    translate([5, 0, -5]){
color("red") cylinder(h=18, r=5, centre=true, $fn=50);
    }
}

translate([-5,0,100]) {
color("blue") cube([10,5,13], centre=true); //  main contact
    translate([0,0,13]){
color("blue") cube([10,13,5], centre=true); // end bearing 
    }
translate([5, 0, 0]){
color("blue") cylinder(h=18, r=5, centre=true, $fn=50);
}
}

 translate([0,0,-20])hull(){
    translate([0, 0, -5])
    color("green") cylinder(h=1, r=5, centre=true, $fn=50);
    translate([0,7,-13])rotate(90,[1,0,0])difference(){
            cylinder(h=1, r=5, centre=true, $fn=50);
            translate([0,5,0])cube(10,10,1);
    } // end difference
     
     //cube([10,1,5], centre=true);
} // end hull

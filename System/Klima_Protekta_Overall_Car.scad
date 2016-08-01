// whole car


car_length = 4000.0; 
car_width = 1080.0; // mm 1.1m
car_waist_to_base = 200.0; // mm
car_wasit_to_top = 900.0; // mm
twelve_foot_lane = 12 * 12 * 25.4; //mm
echo ("Twleve foot lane in mm:", twelve_foot_lane);


// lower part of car below waist
resize([car_length, car_width, car_waist_to_base]){
    difference(){
        sphere(100, $fn=50);
        translate([-100,-100,0])cube(200,200,51);
    }
} 

// upper part of car above waist
difference(){
color("green")resize([car_length, car_width, car_wasit_to_top]){
    difference(){
        sphere(100, $fn=50);
        translate([-100,-100,-200])cube(200,200,51);
    }
}
translate([0,(600),0])rotate(90,[1,0,0])cylinder(car_width+100, 700,700);
}

// wheels
color("blue")translate([0.6*(car_length/2),car_width/2,0])rotate(90,[1,0,0])cylinder(120,300,300);
color("blue")translate([0.6*(car_length/2),-(car_width/2)+120,0])rotate(90,[1,0,0])cylinder(120,300,300);

color("blue")translate([-0.6*(car_length/2),car_width/2,0])rotate(90,[1,0,0])cylinder(120,300,300);
color("blue")translate([-0.6*(car_length/2),-(car_width/2)+120,0])rotate(90,[1,0,0])cylinder(120,300,300);
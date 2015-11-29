/* Component - photosource - dimensions go in here to be used in constructive geometry.  Measurements made with digital vernier calipers and are in mm. 
*/

photosource_body_height = 5.00; // excluding dome
photosource_body_diameter = 5.00; 
photosource_hat_rim_height = 0.80;
photosource_hat_rim_diameter = 5.86;
// cut off diameter 5.52
photosource_wire_long_length = 28.8; 
photosource_wire_short_length = 27.1; 
photosource_wire_diameter = 0.50; 
photosource_wire_offset = 2.0; 

photosource_unit_price = 2.00; // Pounds Sterling

translatecolor("blue")sphere(2.5);

color("yellow")cylinder(photosource_body_height,photosource_body_diameter/2,photosource_body_diameter/2, $fn=500);
translate([0,0,-photosource_hat_rim_height])
color("orange")cylinder(photosource_hat_rim_height,photosource_hat_rim_diameter/2,photosource_hat_rim_diameter/2, $fn=500);

translate([-photosource_wire_offset/2,0,-photosource_wire_long_length])
cylinder(photosource_wire_long_length,photosource_wire_diameter/2,photosource_wire_diameter/2, $fn=4);
translate([photosource_wire_offset/2,0,-photosource_wire_short_length])
cylinder(photosource_wire_short_length,photosource_wire_diameter/2,photosource_wire_diameter/2, $fn=4);
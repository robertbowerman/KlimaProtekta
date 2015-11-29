/* Component - photosensor - dimensions go in here to be used in constructive geometry.  Measurements made with digital vernier calipers and are in mm. 
*/

photosensor_body_height = 4.43;
photosensor_body_diameter = 4.80; 
photosensor_hat_rim_height = 0.85;
photosensor_hat_rim_diameter = 5.71;
photosensor_wire_long_length = 29.0; 
photosensor_wire_short_length = 27.25; 
photosensor_wire_diameter = 0.60; 
photosensor_wire_offset = 2.0; 

photosensor_unit_price = 2.00; // Pounds Sterling

color("yellow")cylinder(photosensor_body_height,photosensor_body_diameter/2,photosensor_body_diameter/2, $fn=500);
translate([0,0,-photosensor_hat_rim_height])
color("orange")cylinder(photosensor_hat_rim_height,photosensor_hat_rim_diameter/2,photosensor_hat_rim_diameter/2, $fn=500);

translate([-photosensor_wire_offset/2,0,-photosensor_wire_long_length])
cylinder(photosensor_wire_long_length,photosensor_wire_diameter/2,photosensor_wire_diameter/2, $fn=4);
translate([photosensor_wire_offset/2,0,-photosensor_wire_short_length])
cylinder(photosensor_wire_short_length,photosensor_wire_diameter/2,photosensor_wire_diameter/2, $fn=4);
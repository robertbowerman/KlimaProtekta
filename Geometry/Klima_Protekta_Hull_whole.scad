/* This file contains the key dimensions of various aspects of the Chassis subsystem.  Change it in one place and everything that is affected by that change is recomputed to be correct. 

This file is to be "include"d into all other traction geometry files.  

include <KlimaProtekta/Chassis/Geometry/Klima_Protekta_Chassis_Dimensions.scad>;

One advantage of this approach is that it enforces consistency between parts of the car.  

Remember: Calculate Everything (avoid endless tweaking) 

*/

car_widthMM = 1100;  //mm, 1,730mm is Zoe
car_lengthMM = 3500; //mm, 4,084 mm is Zoe

include </users/KlimaProtekta/Battery/Geometry/Klima_Protekta_Battery_Dimensions.scad>;

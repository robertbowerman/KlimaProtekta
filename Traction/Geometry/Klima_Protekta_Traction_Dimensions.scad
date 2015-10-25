/* This file contains the key dimensions of various aspects of the traction subsystem.  Change it in one place and everything that is affected by that change is recomputed to be correct. 

This file is to be "include"d into all other traction geometry files.  

include <KlimaProtekta/Traction/Geometry/Klima_Protekta_Traction_Dimensions.scad>;

One advantage of this approach is that it enforces consistency between parts of the car.  

Remember: Calculate Everything (avoid endless tweaking) 


*/

// One unit is one millimeter here
permanentMagnetWidth = 10; // generally width is X (but magnets are rotated here)
permanentMagnetDepth = 10; // generally depth is Y (but magnets are rotated here)
permanentMagnetHeight = 10; // generally height is Z (but magnets are rotated here)
magnetsPerCircle = 64; 
magnetCirclesPerWheel = 2; 
wheelsPerCar = 4; 
echo("Traction Permanent Magnets Per Car: ", magnetsPerCircle * magnetCirclesPerWheel * wheelsPerCar);

degreesPerMagnet = 360 / magnetsPerCircle; // includes gap between magnets
gapEasyInsert = 0.3; // air for both front and back added together, rule of thumb (test to ensure no rattling)
magnetHoleWidth = permanentMagnetWidth + gapEasyInsert; // default 10.3 mm
magnetToMagnetNylon = 0.3; // this is the smallest distance between two magnets in the circle
magnetToAirgapNylon = 0.4; // layer of nylon to keep magnets from rubbing and shattering
airgap = 0.7; //
electromagnetToAirgapNylon = 0.4; // layer of nylon to keep electromagnets from rubbing and shattering
magnetToElectromagnetGap =  magnetToAirgapNylon + airgap + electromagnetToAirgapNylon;
echo("Permanent Magnet To Electromagnet Gap, commonly called Airgap: ", magnetToElectromagnetGap); // note that this is the maximum.  Affected by permanent magnet having straight edges not curved.  Affected by bearing wobble. 

circleOne = 100; // The smallest circle that all of the permanent magnets have two edges passing through. 

// Klima_Protecta_Traction_Rotor_Grays_Disk

// Design Rationale
/* The gray's disk is a rotary position sensor, acting as an essential part of the brushless DC motor.  Picture two electro-magnets, one as your left hand, the other as your right hand.  Between these two is a permanent magnet.  The position sensor tells you whether theis permanent magnet is a North Pole or a South Pole and also how far along it is.  The motor software will also know the desired direction of travel and thus can decide which electromagnet to make South and which to make North.  

Occassionally the permanent magnet can be bang on or very close to the electromagnet.  If there is also some little momentum in one direction or other the rotor can start rotating in the wrong direction.  In this case the position sensor needs to detect that the rotor is starting to move in the wrong direction and reverse the field before any distance has been moved.  This reversal should happen well before 1cm and best before 1mm. 

Additionally, as the wheel moves off (in the right direction, or now in the right direction) there is a need to adjust the force to get it moving at the right speed.  Force could be adjusted by voltage or by pulse width modulation, but we use PWM.  In either case the gray's disk must detect positions between the magnets. 

The Greys disk is attached to the rotor and spins with the wheel.  The photosensor is part of the stator and does not rotate.  The 

There are 64 magnets in a circle, which is 2 ** 6.  We also wish to detect between magnets - suppose we have 16 positions between magnets, which is 2 ** 4.  Hence that needs 6 + 4 = 10 photosensors

*/
// Features

include<Klima_Protekta_Traction_Dimensions.scad>;
echo (magnetsPerCircle);
difference(){
    color("black") cylinder(2,100, 100); // basic disk, we want to keep, but take parts out of
    translate([0,0,-1])
    difference(){
        color("blue") cylinder(4,90, 90);// first part to remove, running from -1 to +3, so its 1 more each side of 0 to 2. 
        translate([0,0,-1]) union(){
            color("blue") cylinder(6,80, 80); //lies from 0 to 6 in Z direction, translated to -1 to 5, then again to -2 to 4
            translate([-90,0,0])color("blue")cube([180, 90, 6], centre=true);
        } 
    }
} 
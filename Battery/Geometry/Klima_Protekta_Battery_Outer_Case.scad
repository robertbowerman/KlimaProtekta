// Battery Subsystem - Outer Case

include </Users/robertbowerman/GitHub/KlimaProtekta/Battery/Geometry/Klima_Protekta_Battery_Dimensions.scad>;

color("blue")
cube(size = [actualBatteryYHorizontalAxisWidthMM,batteryLengthThreeParallelMM,chassisInternalSpaceVerticalMM], center = false);
color("red")
translate([-actualBatteryYHorizontalAxisWidthMM, 0,0])cube(size = [actualBatteryYHorizontalAxisWidthMM,batteryLengthThreeParallelMM,chassisInternalSpaceVerticalMM], center = false);

//echo("Size of three battery packs next to each other in car", batteryLengthThreeParallelMM, "MM Y length *", actualBatteryYHorizontalAxisWidthMM * 3, "MM X width *", chassisInternalSpaceVerticalMM, "MM Z height *");
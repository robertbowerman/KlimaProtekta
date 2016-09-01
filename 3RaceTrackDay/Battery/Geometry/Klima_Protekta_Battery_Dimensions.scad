/* This file contains the key dimensions of various aspects of the Battery subsystem.  Change it in one place and everything that is affected by that change is recomputed to be correct.  It has no display, on purpose. 

This file is to be "include"d into all other Battery geometry files.  

include <KlimaProtekta/Battery/Geometry/Klima_Protekta_Battery_Dimensions.scad>;

One advantage of this approach is that it enforces consistency between parts of the car.  

Remember: Calculate Everything (avoid endless tweaking) 

*/

// One unit is one millimeter here
18650LithiumIonCellDiameterMM = 18; // they do vary
18650LithiumIonCellLengthMM = 65; // they do vary more 
18650LithiumIonCellVoltage = 3.7; // Volts, decreases as charge is drained, balance with PWM (pulse width modulation)
18650LithiumIonCellEnergyMAH = 4000; // measued in milliamp hours

18650LithiumIonCellWattHours = 18650LithiumIonCellVoltage * 18650LithiumIonCellEnergyMAH / 1000;
echo("Watt Hours Per 18650 Lithium Ion Cell: ", 18650LithiumIonCellWattHours, "Watt Hours");


systemHighVoltage = 400; //Volts. Bike wheel is 36 volts.  Mark II will up this to approx 1kV. 
cellsInSeriesForSystemHighVoltageQty = floor(systemHighVoltage / 18650LithiumIonCellVoltage) ;
echo("Rounded Down Integer Number of 18650 Lithium Ion Cells in series for System High Voltage: ", cellsInSeriesForSystemHighVoltageQty, "Quantity");


batteryEnergyCapacityWattHours = 22000; //Watt Hours. Same as my Renault Zoe, in blue or green mode.  Pretty close to BMW and Leaf (but not the very latest models).  Mark II will up this to double or treble. 
cellsInTotalForBatteryEnergyCapacityWattHoursQty = floor(batteryEnergyCapacityWattHours / 18650LithiumIonCellWattHours) ;

echo("Number of 18650 Lithium Ion Cells in total for Battery Energy Capacity in Watt Hours: ", cellsInTotalForBatteryEnergyCapacityWattHoursQty, "Quantity");

batteryLengthOneParallelMM = cellsInSeriesForSystemHighVoltageQty * 18650LithiumIonCellLengthMM;
echo("Battery Length of Cells in mm if one wide, so one in parallel: ", batteryLengthOneParallelMM, "mm");
batteryLengthTwoParallelMM =  (cellsInSeriesForSystemHighVoltageQty / 2) * 18650LithiumIonCellLengthMM;
echo("Battery Length of Cells in mm if two wide, so two in parallel: ", batteryLengthTwoParallelMM, "mm");

cellsInSeriesForSystemHighVoltageThreeInParallelQty = cellsInSeriesForSystemHighVoltageQty / 3;


batteryLengthThreeParallelMM = cellsInSeriesForSystemHighVoltageThreeInParallelQty * 18650LithiumIonCellLengthMM;
echo("Battery Length of Cells in mm if three wide, so three in parallel: ", batteryLengthThreeParallelMM, "mm, with:", cellsInSeriesForSystemHighVoltageQty / 3, "Cells Quantity");
echo("12 feet lane width in mm: ", 12 * 12 * 25.4, "mm - too tight, so go for Three in Parallel");

// If the chassis internal space is 120mm tall, it fits 6 cells high
batteryCylinderTubeWallThicknessMM = 1.0; //mm.  Start with plastic, go on to copper if necessary for coooling.  Design Aim is to have no cooling.  Trick to do this is to have lots of batteries and drair or charge all in parallel.  Max charge rate is about CHAdeMO or 50kW.  Main way to get power in is by battery swap (like the scooter).  If a charger delivered more than 50kW then the car would throttle that to 50kW and spread the power charge across all three battery packs. 
allowanceForSmoothAssemblyMM = 0.3; // mm
batteryCylinderTubeOuterDiameterMM = (batteryCylinderTubeWallThicknessMM * 2) + 18650LithiumIonCellDiameterMM + allowanceForSmoothAssemblyMM;
// later check calculatiaon for the allowance for smooth assembly loading of cells into the tubes.
chassisInternalSpaceVerticalApproxMM = 120; // mmm
numberofBatteryCylinderTubesVerticallyInChassisQty = 6; // Quantity
chassisInternalSpaceVerticalMM = numberofBatteryCylinderTubesVerticallyInChassisQty * batteryCylinderTubeOuterDiameterMM;
echo("Battery Height in mm if six cell diameters and tubes tall: ", chassisInternalSpaceVerticalMM, "mm");

cellsOnYVerticalFaceForThreeParallelQty = numberofBatteryCylinderTubesVerticallyInChassisQty * cellsInSeriesForSystemHighVoltageThreeInParallelQty;
echo("Number of 18650 Lithium Ion Cells on Y vertical face: ", cellsOnYVerticalFaceForThreeParallelQty, "Quantity");

cellsOnXHorizontalAxisForBatteryEnergyCapacityQty = cellsInTotalForBatteryEnergyCapacityWattHoursQty / cellsOnYVerticalFaceForThreeParallelQty;
echo("Exact Number of 18650 Lithium Ion Cells on X horizonal axis to get overal capacity: ", cellsOnXHorizontalAxisForBatteryEnergyCapacityQty, "Quantity");

cellsOnXHorizontalAxisForBatteryEnergyCapacityIntegerQty = ceil( cellsInTotalForBatteryEnergyCapacityWattHoursQty / cellsOnYVerticalFaceForThreeParallelQty);
echo("Integer Number, rounded up, of 18650 Lithium Ion Cells on X horizonal axis to get overal capacity: ", cellsOnXHorizontalAxisForBatteryEnergyCapacityIntegerQty, "Quantity");

actalBatteryTotalCellsQty = cellsOnXHorizontalAxisForBatteryEnergyCapacityIntegerQty * cellsOnYVerticalFaceForThreeParallelQty;
echo("Actual integer number of 18650 Lithium Ion Cells in battery to get overal capacity and be rectangular: ", actalBatteryTotalCellsQty, "Quantity");

actalBatteryTotalCapacitykW = actalBatteryTotalCellsQty * 18650LithiumIonCellWattHours /1000;
echo("Actual rectangular battery overall capacity: ", actalBatteryTotalCapacitykW, "kWh");

actualBatteryYHorizontalAxisWidthMM = batteryCylinderTubeOuterDiameterMM * cellsOnXHorizontalAxisForBatteryEnergyCapacityIntegerQty;
echo("Actual rectangular battery overall dimensions", batteryLengthThreeParallelMM, "MM Y length *", cellsOnXHorizontalAxisForBatteryEnergyCapacityIntegerQty, "MM X width *", chassisInternalSpaceVerticalMM, "MM Z height *");



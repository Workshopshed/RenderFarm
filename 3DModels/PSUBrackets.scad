module vertical() {
	translate([0,10,0])
		cube([15,5,45]);
	translate([0,5,10])
		fillet(10,15);
}

module fillet(filletsize,width)
{
	difference() {
	translate([0,-filletsize/2,-filletsize/2])
		cube([width,filletsize,filletsize]);
	translate([-1,0,0])
		rotate([0,90,0])
			cylinder(width+2,d=filletsize,$fn=100);
    translate([-1,-filletsize,-filletsize/2])
		cube([width+2,filletsize,filletsize]);
    translate([-1,-filletsize/2,0])
		cube([width+2,filletsize,filletsize]);		
	}
}


module tab() {
difference() {
	union() {
		cube([15,15,5]);
		translate([15/2,0,0])
			cylinder(5,d=15,$fn=100);
		}
    translate([15/2,0,1])			
		countersink(3);
	}
}

module countersink(drillsize)
	union() {
		cylinder(drillsize*3,0,drillsize*3,$fn=100);
		translate([0,0,-5])
		cylinder(10,d=drillsize,$fn=100);
	}
	
module bracket() {
difference() {
	union() {
			tab();
			vertical();
			translate([0,130,0])
				mirror([0,1,0]) {
					union() {
						tab();
						vertical();
					}
			}
			translate([0,10,40])
				cube([15,110,5]);
		}
		translate([16,115,40])
			rotate([0,180,0])
				fillet(10.5,16);
		translate([0,15,40])
			rotate([180,0,0])
				fillet(10.2,16);
	}
}


bracket();
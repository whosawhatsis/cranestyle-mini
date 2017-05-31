h = 13.5;

$fs = .2;
$fa = 2;

difference() {
	union() {
		linear_extrude(25, convexity = 5) difference() {
			offset(-3) offset(5) offset(-2) {
				square([28, 10], center = true);
				translate([15, 0, 0]) square([10, 10], center = true);
				translate([15, 10, 0]) square([10, 30], center = true);
			}
			for(i = [1, -1]) translate([i * 10, 0, 0]) circle(3/2 + .1);
		}
		translate([0, 0, h]) rotate([-90, 0, 0]) translate([-15, 0, 0]) #*linear_extrude(25, convexity = 5) {
			circle(5);
			intersection() {
				rotate(90) translate([0, -5, 0]) square([20, 10]);
				rotate(135) translate([0, -5, 0]) square([20, 10]);
			}
			translate([-5, 0, 0]) square([10, 13.5]);
		}
	}
	translate([0, 3, 25 - h]) rotate([-90, 0, 0]) {
		cylinder(r = 8/2 + .1, h = 20, center = true);
		translate([15, 0, 0]) {
			cylinder(r = 3/2 + .1, h = 100, center = true);
			translate([0, 0, -16]) cylinder(r = 3.25 + .1, h = 10, $fn = 6);
		}
		for(i = [0:2]) rotate(i * 120 - 45) translate([0, -6.35, 2]) {
			cylinder(r = 3/2 + .2, h = 100, center = true);
			cylinder(r = 3.5, h = 20);
		}
	}
	*translate([28, 0, 22]) cube(40, center = true);
	for(i = [1, -1]) translate([i * 10, 0, -1]) cylinder(r = 3 / 2 + .1, h = 100);
	//for(i = [1, -1]) translate([i * 10, 0, 25 - 4]) cylinder(r = 3.5, h = 10);
	//for(i = [1]) translate([i * 10, 0, 2]) cylinder(r = 3.5, h = 100);
	translate([0, 15, 25]) cube([32, 9, 14], center = true);
}
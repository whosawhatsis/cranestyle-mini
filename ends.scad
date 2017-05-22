rows = 4;

$fs = .2;
$fa = 2;

for(end = [0, 1]) mirror([0, end, 0]) translate([0, 11, 0]) difference() {
	linear_extrude(6, convexity = 5) offset(1) offset(-1) union() {
		square([20 * rows, 20], center = true);
		translate([10 * rows - 15, 0, 0]) square([15, 15]);
		if(!end) translate([-10 * rows, 0, 0]) square([20, 10 + 15 * 2]);
	}
	translate([10, 0, 3]) rotate([90, 0, 0]) {
		cylinder(r = 3 / 2 / cos(180 / 6), h = 100, center = true, $fn = 6);
		cube([5.6, 10, 3], center = true);
	}
	for(i = [.5:rows]) if(i != 2.5) translate([-rows * 10 + i * 20, 0, 0]) difference() {
		union() {
			cylinder(r = 5/2, h = 20, center = true);
			cylinder(r = 5, h = 6, center = true);
		}
		cylinder(r = 5/2 + .5, h = 5.6, center = true);
	}
	for(i = [.5:2]) translate([-rows * 10 + 10, 10 + 15 * i, 0]) difference() {
		union() {
			cylinder(r = 5/2, h = 20, center = true);
			cylinder(r = 5, h = 6, center = true);
		}
		cylinder(r = 5/2 + .5, h = 5.6, center = true);
	}
}


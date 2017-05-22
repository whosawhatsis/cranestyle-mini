$fs = .2;
$fa = 2;

difference() {
	linear_extrude(8.5, convexity = 5) difference() {
		union() {
			square([16, 20], center = true);
			translate([-8, 0, 0]) square([32 + 8, 10 + 8]);
		}
		for(x = [1, -1], y = [1, -1]) translate([x * 5, y * 7.5, 0]) circle(3/2 + .1);
		for(x = [1, -1]) translate([5 + 12 + x * 12, 7.5, 0]) circle(3/2 + .1);
	}
	translate([5 + 12, 5 + 4, 15 / 2 + 3]) rotate([90, 0, 0]) linear_extrude(100, center = true) intersection() {
		circle(16);
		square([32, 15], center = true);
	}
	translate([4, 18, -3.2]) rotate([90, -90 - 33, 0]) linear_extrude(16, center = true, convexity = 5) offset(-.4) offset(.8) offset(-.4) {
		for(i = [0:20]) translate([i * 2, 0, 0]) square([1, 2]);
		square([40, 1]);
	}
}
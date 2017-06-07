B = 20;
C = 15;
L = 35;
L1 = 22;
W = 27;
h = 12;

trigger = 10 + 3;

$fs = .2;
$fa = 2;

difference() {
	linear_extrude(4, convexity = 5) difference() {
		offset(1) offset(-2) offset(1) {
			square([W, L], center = true);
			translate([-5, 0, 0]) square([W + 10, L1], center = true);
			translate([-W/2 - 10 - 17, -L/2 + trigger, 0]) square([W/2 + 10 + 17, L/2 + L1/2 - trigger]);
		}
		for(x = [1, -1], y = [1, -1]) translate([x * B/2, y * C/2, 0]) circle(3 / 2);
		translate([-20, 0, 0]) circle(3 / 2);
	}
}

difference() {
	linear_extrude(2 + h, convexity = 5) difference() {
		offset(1) offset(-2) offset(1) {
			translate([-5, 0, 0]) square([W + 10, L1], center = true);
		}
		translate([-20, 0, 0]) circle(3 / 2);
		offset(-.4) offset(.4) {
			square([W + 2, L + 2], center = true);
			for(i = [.5:10], j = [1, -1]) translate([0, 2 * i * j, 0]) square([W + 5, 1], center = true);
		}
;
	}
	translate([-20, 0, h]) rotate(90) cylinder(r = 6.5/2, h = 10, $fn = 6);
}
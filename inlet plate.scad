switch = [13, 19];
inlet = 8;
w = 18;
pos = [20, 40];

$fs = .2;
$fa = 2;

difference() {
	linear_extrude(6, convexity = 5) difference() {
		offset(1) offset(-1) {
			translate([-w/2, -10, 0]) square([w, 20 + pos[1] + switch[1]/2 + 5]);
			square([35, 20], center = true);
		}
		translate([0, 10 + pos[0], 0]) circle(inlet/2);
		translate([0, 10 + pos[1], 0]) square(switch, center = true);
	}
	translate([0, 0, 3]) linear_extrude(6, convexity = 5) {
		translate([0, 10 + pos[0], 0]) offset(2) circle(inlet/2);
		translate([0, 10 + pos[1], 0]) offset(1.5) square(switch, center = true);
	}
	for(i = [-1, 1]) if(i != 2.5) translate([-i * 8, 0, 0]) difference() {
		union() {
			cylinder(r = 5/2, h = 20, center = true);
			cylinder(r = 5, h = 6, center = true);
		}
		cylinder(r = 5/2 + .5, h = 5.6, center = true);
	}
}
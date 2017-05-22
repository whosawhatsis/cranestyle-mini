thick = 8;
a = 30;
h = 35;

$fs = .2;
$fa = 2;

intersection() {
	rotate([-a, 0, 0]) translate([0, 0, 50 - 20]) linear_extrude(100, center = true, convexity = 5) scale([1, 1 / cos(a), 1]) offset(1) offset(-1) offset(thick) offset(-thick) translate([-thick, -100, 0]) square([thick + 80, h + thick / 2 + 100]);
				
	difference() {
		intersection() {
			rotate([a, 0, 0]) translate([0, 0, -50 + 20]) linear_extrude(100, center = true, convexity = 5) scale([1, 1 / cos(a), 1]) offset(1) offset(-1) difference() {
				offset(thick) offset(-thick)  {
					square([45, h]);
					translate([-thick, 0, 0]) {
						square([thick + 80, h + thick]);
						translate([0, h - thick * 2, 0]) square([thick / 2 + 80, thick * 3]);
					}
				}
				offset(-thick / 2) offset(thick * 1.5) offset(-thick) {
					for(i = [0:.2:80]) hull() for(i = [i, i + .2]) translate([i, thick, 0]) square([.2, h - thick - pow(1 + cos(i * 360 / 80 * 4 + 60), 2)]);
					translate([45, - thick, 0]) square([80, h]);
					translate([80, 0, 0]) square([80, h + thick]);
				}
			}
			linear_extrude(20 * cos(a) + thick * sin(a), convexity = 5) square(200, center = true);
		}
		translate([0, h / cos(a), 20 * cos(a) + thick * sin(a)]) intersection() {
			rotate([90 + a * 2, 0, 0]) cube([100, 20, 20]);
			rotate([90 + a, 0, 0]) cube([200, 100, 40], center = true);
		}
		rotate([a - 90, 0, 0]) for(i = [10, 30]) translate([i, -10, 4]) {
			cylinder(r = 5.2 / 2, h = 50, center = true);
			cylinder(r = 9.5 / 2, h = 50);
		}
	}
}
h = 13.5;

$fs = .2;
$fa = 2;

difference() {
	union() {
		linear_extrude(5, convexity = 5) difference() {
			offset(1) offset(-1) hull() {
				square([30, 20], center = true);
				translate([22 - 5, 0, 0]) square([10, 20], center = true);
			}
			for(i = [1, -1]) translate([i * 10, 0, 0]) hull() for(j = [1, -1]) translate([j * 2, 0, 0]) circle(3/2 + .1);
		}
		translate([22, 0, 0]) rotate([-90, 0, 0]) linear_extrude(20, convexity = 5, center = true) hull() for(i = [5 * sin(45), 6.5]) translate([0, -i, 0]) intersection() {
			union() {
				circle(5);
				rotate(180) square(5);
			}
			square([10, 10 / sqrt(2)], center = true);
		}
	}
	translate([22, 0, 7.5]) rotate([-90, 0, 0]) {
		cylinder(r = 3/2 + .1, h = 100, center = true);
		translate([0, 0, -10]) cylinder(r = 3.25 + .1, h = 4, center = true, $fn = 6);
	}
	//translate([28, 0, 22]) cube(40, center = true);
	translate([0, 0, 5 + 3.5]) cube([34, 9.2, 10], center = true);
}

translate([0, 20, 0]) difference() {
	linear_extrude(4) difference() {
		offset(2) hull() for(i = [1, -1]) translate([i * 10, 0, 0]) circle(6.5/2, $fn = 6);
		for(i = [1, -1]) translate([i * 10, 0, 0]) circle(3/2 + .2);
	}
	translate([0, 0, 1]) linear_extrude(4) for(i = [1, -1]) translate([i * 10, 0, 0]) circle(6.5/2, $fn = 6);
}
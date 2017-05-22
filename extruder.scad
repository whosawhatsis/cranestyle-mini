h = 10;
gear = 8.5;
gearclearance = .3;
a = 15;
screwspacing = 26;
filament = 1.75;
filamentclearance = .3;
idler = 11.5;
idlerclearance = .3;
spring = 18;

$fs = .2;
$fa = 2;

//%for(x = [1, -1], y = [1, -1]) translate([x * screwspacing/2, y * screwspacing/2, 0]) cylinder(r = 3/2, h = 20);

difference() {
	union() {
		linear_extrude(h + 6, convexity = 5) difference() {
			union() {
				rotate(-a) square([screwspacing/2, screwspacing/2 + 3/2 + 2]);
				hull() {
					for(x = [1], y = [1, -1]) translate([x * screwspacing/2, y * screwspacing/2, 0]) circle(3/2 + 2);
					translate([screwspacing/2, -screwspacing/2, 0]) rotate(-a) translate([0, screwspacing, 0]) circle(3/2 + 2);
				}
			}
			for(x = [1, -1], y = [1, -1]) translate([x * screwspacing/2, y * screwspacing/2, 0]) circle(3/2 + .2);
			circle(gear/2 + gearclearance);
			translate([-screwspacing/2, screwspacing/2]) for(i = [-3:15]) hull() for(i = [i, i + 1]) rotate(i) translate([screwspacing/2, -screwspacing/2]) rotate(-a) translate([0, gear/2 + filament + idler / 2, 0]) circle(idler / 2 + idlerclearance);
		}
		mirror([1, 0, 0]) intersection() {
			hull() {
				translate([-screwspacing / 2, -screwspacing / 2 + 2, 5]) rotate([0, 90, 0]) {
					cylinder(r = 5, h = screwspacing/2 - spring/2 + 2);
					translate([0, 0, -3]) cylinder(r = 3, h = 1);
				}
			}
			linear_extrude(h * 2) square(screwspacing * 2, center = true);
		}
	}
	rotate([0, 90, -a]) translate([-h, gear/2 + filament / 2, 0]) {
		cylinder(r = filament/2 + filamentclearance, h = 100, center = true);
		cylinder(r = 0, r1 = 6, h = 8, center = true);
		translate([0, 0, 19]) {
			cylinder(r = 4, h = 13, center = true);
			cylinder(r = 2.2, h = 25, center = true);
		}
	}
	translate([0, 0, h + 3.5]) cylinder(r = gear/2 + 2, h = 10);
	translate([0, -screwspacing / 2 + 2, 5]) rotate([0, 90, 0]) cylinder(r = 4, h = spring, center = true);
	for(x = [1, -1], y = [1, -1]) translate([x * screwspacing/2, y * screwspacing/2, 0]) cylinder(r = 3/2 + .2, h = 20);
}

//rotate([0, 90, -a]) translate([-h, gear/2 + filament / 2, 0]) cylinder(r = filament/2 + filamentclearance - .2, h = 3);

difference() {
	union() {
		linear_extrude(h + 6, convexity = 5) difference() {
			union() {
				hull() {
					translate([-screwspacing/2, screwspacing/2, 0]) circle(3/2 + 3);
					translate([-screwspacing/2, -screwspacing/2, 0]) circle(3/2 + 2);
				}
				hull() {
					for(x = [-1], y = [1]) translate([x * screwspacing/2, y * screwspacing/2, 0]) circle(3/2 + 3);
					rotate(-a) translate([0, gear/2 + filament + idler / 2, 0]) circle(idler / 2 - 1);
				}
			}
			translate([-screwspacing/2, screwspacing/2, 0]) circle(4.6/2 + .2);
			circle(gear/2 + gearclearance);
			rotate(-a) translate([0, gear/2 + filament + idler / 2, 0]) circle(3/2);
		}
		intersection() {
			hull() {
				translate([-screwspacing / 2, -screwspacing / 2 + 2, 5]) rotate([0, 90, 0]) {
					cylinder(r = 5, h = screwspacing/2 - spring/2 + 2);
					translate([0, 0, -3]) cylinder(r = 3, h = 1);
				}
			}
			linear_extrude(h * 2) square(screwspacing * 2, center = true);
		}
	}
	rotate([0, 90, -a]) translate([-h, gear/2 + filament / 2, 0]) {
		cylinder(r = filament/2 + filamentclearance, h = 100, center = true);
	}
	translate([-screwspacing/2, screwspacing/2, 6]) cylinder(r = 7/2 + .2, h = h);
	//translate([-screwspacing/2, screwspacing/2, 0]) linear_extrude(7, center = true, convexity = 5) for(i = [-3:15]) hull() for(i = [i, i + 1]) rotate(i) translate([0, -screwspacing, 0]) circle(7/2);
	translate([0, screwspacing / 2, h + 10]) cube([screwspacing + 10, 20, 26], center = true);
	translate([0, -screwspacing / 2 + 2, 5]) rotate([0, 90, 0]) cylinder(r = 4, h = spring, center = true);
	for(x = [1, -1], y = [1, -1]) translate([x * screwspacing/2, y * screwspacing/2, 0]) cylinder(r = 3/2 + .2, h = 20);
}


h = 7;

$fs = .2;
$fa = 2;

if(h > 2) linear_extrude(2) difference() {
	offset(1) offset(-1) square([16, 25], center = true);
	for(i = [1, -1]) translate([0, i * 19 / 2, 0]) circle(2);
}
difference() {
	linear_extrude(h + 6, convexity = 5) difference() {
		offset(1) offset(-1) translate([-3, -25 / 2, 0]) square([16, 25]);
		for(i = [1, -1]) translate([0, i * 19 / 2, 0]) circle(1.6);
	}
	translate([0, 0, h + 6]) cube([13, 13, 12], center = true);
	translate([6, 0, h + 6]) cube([7, 30, 2], center = true);
}
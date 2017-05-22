B = 20;
C = 15;
L = 35;
W = 27;
offset = -24;

$fs = .2;
$fa = 2;

difference() {
	linear_extrude(6, convexity = 5) difference() {
		offset(4) offset(-4) square(100, center = true);
		circle(3/2 + .2);
		for(x = [1, -1], y = [1, -1]) translate([x * 46, y * 46, 0]) circle(3/2 + .2);
		for(x = [1, -1], y = [1, -1]) translate([offset + x * B/2, y * C/2, 0]) circle(3/2 + .2);
	}
	//translate([offset, 0, 4])  linear_extrude(6) offset(.5) square([W, L], center = true);
	translate([0, 0, 3]) linear_extrude(6) for(x = [1, -1], y = [1, -1]) translate([offset + x * B/2, y * C/2, 0]) circle(3);
	//translate([0, 0, 4]) linear_extrude(6) for(a = [45:90:360]) hull() for(i = [0, 1]) rotate(a) translate([46 * sqrt(2) + i * 10, 0, 0]) circle(3.6, $fn = 6);
}

//linear_extrude(2.8) for(x = [1, -1], y = [1, -1]) translate([offset + x * B/2, y * C/2, 0]) circle(3.5/2);

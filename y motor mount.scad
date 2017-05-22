$fs = .2;
$fa = 2;

difference() {
	linear_extrude(20, convexity = 5) {
		difference() {
			hull() {
				offset(5) offset(-5) square([35, 35], center = true);
				for(y = [1, -1]) translate([0, y * 20, 0]) circle(5);
			}
			for(x = [1, -1], y = [1, -1]) translate([x * 13, y * 13, 0]) circle(3/2);
			for(y = [1, -1]) translate([0, y * 20, 0]) circle(5/2);
			circle(11.1);
		}
	}
	linear_extrude((20 - 5) * 2, center = true, convexity = 5) for(y = [1, -1]) hull() for(i = [0, 1]) translate([0, y * (20 + i * 20), 0]) circle(5);
		
	linear_extrude(8 * 2, center = true, convexity = 5) hull() for(i = [0, 1]) translate([i * 50, 0, 0]) circle(5);


	translate([0, 0, 8]) linear_extrude(20, convexity = 5) {
		for(x = [1, -1], y = [1, -1]) translate([x * 13, y * 13, 0]) circle(3/2);
		hull() for(i = [-1:1]) translate([-abs(i) * 50, i * 50, 0]) circle(7);
		translate([-20, 0, 0]) square([20, 100], center = true);
	}

	translate([0, 0, 5]) linear_extrude(20, convexity = 5) {
		for(x = [1, -1], y = [1, -1]) translate([x * 13, y * 13, 0]) circle(3);
	}
}

linear_extrude(20 - 5 - .2, convexity = 5) for(y = [1, -1]) hull() for(i = [0, 1]) translate([0, y * (20 + i * 10), 0]) circle(5/2 + .5);
	
linear_extrude(8 - .2, convexity = 5) hull() for(i = [0, 1]) translate([10 + i * 10, 0, 0]) circle(3);


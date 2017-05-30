$fs = .2;
$fa = 2;

linear_extrude(1) difference() {
	circle(5);
	circle(3.2 / 2);
}
linear_extrude(1.5) difference() {
	intersection() {
		circle(5);
		square([5.5, 10], center = true);
	}
	circle(3.2 / 2);
}
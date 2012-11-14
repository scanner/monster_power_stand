//
// a simple stand for a monster power outlets to go power strip to help it
// stand up when used with a 2-prong to 3-prong adapter
//
use <Libs.scad>;

padding = 0.05;

stand_h = 29;
// stand_h = 3;
// ear_h = 4.55;
ear_h = 10.55;
total_stand_h = ear_h + stand_h;
stand_int_w = 25.5;
// stand_w = stand_int_w + 4.9;
stand_w = stand_int_w + 8;
stand_l = 25;

module mo_pow_cutout() {
    translate( v = [0, 0, (ear_h - 1) / 2] ){
        difference() {
        union() {
            cube( size = [stand_l + 5, stand_int_w, ear_h - 1], center = true);
            translate( v = [0, 0, 3] ) {
                cube( size = [stand_l + 5, stand_int_w + 4.9, ear_h - 1], center = true);
            }
        }
        rotate([0, 90, 0]) {
            translate( v = [ (4.9/3),((stand_int_w/2) + (4.9/2)) , 0 ] ) {
                cylinder( h = stand_l + 5 + padding, r = (4.9/2), center = true, $fn = 20 );
            }
            translate( v = [ (4.9/3), -((stand_int_w/2) + (4.9/2)),0 ] ) {
                cylinder( h = stand_l + 5 + padding, r = (4.9/2), center = true, $fn = 20 );
            }
        }
    }
    }
}

module mo_pow_stand() {
    difference() {
        translate(v = [0, 0, total_stand_h / 2]) {
            roundRect(size = [stand_l, stand_w, total_stand_h], round = 4, center = true);
        }
        translate(v = [0, 0, stand_h]) {
            mo_pow_cutout();
        }
    }
}

mo_pow_stand();
// mo_pow_cutout();


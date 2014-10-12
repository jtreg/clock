// clock holder


holder_h=14;
holder_d=7;

strut_w = 84;
strut_d = 7;
strut_h = 2;
brass_l = 70;
brass_d = 3.6;
plate_d= 135;
plate_h = 2;

//main
	
	$fn=100;


// mechanism();

wall_holder();

//draw_clockface();
		difference(){
			draw_clockface();
			translate([0,0,-2]) mechanism();
					//draw_brass();
     		draw_brasses();
		// cylinder(r=4,h=14, center=true);
		}
	
	

//	draw_brass();
	//arm_test();
	//plate();

// modules

module arm_test(){
	difference(){
		arm();
		translate([5,0,5.0]) draw_brass();
	}
}

module support(x,y,z){
	$fn=100;

	//difference() {
		union(){
			// collar 1
			translate([73-10,0.2,8.5]) rotate([x,y,z]) cube([holder_d, holder_d,holder_h-5]);
			// collar 2
			color("black") 
				translate([40,.2,8.5]) rotate([x,y,z]) cube([holder_d, holder_d,holder_h]);
		}
		//brass(x,y,z);
	//}
}

module mechanism(){
$fn=100;
	color("black") translate([-56/2, -56/2,strut_h+.1]) cube([56,56,16]);
	color("blue") translate([0, 0,-6+strut_h]) cylinder(r=5,h=14);
}

module strut(x,y,z){
	//translate([0,-(strut_d/2),0]) cube([x,y,z]);
	translate([0,-(strut_d/2),0]) cube([x,y,z]);
}

//module brass(x,y,z){

//	color ("blue") 
//	translate([1,2,3]) 
//	rotate([x,y,z]) 
//	cylinder(h=brass_l, d=brass_d);
//}

module arm(){
	strut(strut_w-6, strut_d, strut_h-5);
	 translate([0,-(strut_d/2),0]) support(0,90,0);
}
module draw_arms(){
	for (i=[0:30:360]) {
		rotate([0,0,i]) translate([0,0,0]) arm();
	}
}
module plate(){
	less = strut_w-17;
	$fn=200;
	//difference(){
	//	color("red") cylinder(h=plate_h, r=plate_d/2);
	//	color("blue") translate([0,0,-1])cylinder(h=plate_h+2, r=(plate_d/2)*.9);

	//}
	color("teal") translate(0,0,-0.5) cylinder(r=plate_d/2+5, h=1.5, center=true);
	difference(){
		color("red") cylinder(h=plate_h, r=less);
  		color("blue") translate([0,0,-1])cylinder(h=plate_h+2, r=less*.9);
	}

	difference(){
		color("red") cylinder(h=plate_h, r=less/1.4);
		color("blue") translate([0,0,-1])cylinder(h=plate_h+2, r=less/1.7);

	}


	difference(){
		color("red") cylinder(h=plate_h, r=less/3);
		color("blue") translate([0,0,-1])cylinder(h=plate_h+2, r=less/3-6);

	}


}
module front_hole(){
	rotate(0,0,90) translate([0,0,-2]) cylinder(h=10,d=6);
}

module draw_brass(){
		$fn=50;
	 	color("green") translate([29,0,5]) rotate([0,90,0]) cylinder(h=brass_l,r=brass_d/2);
}

module draw_brasses(){
	for (i=[0:30:360]) {
		rotate([0,0,i]) translate([0,0,0]) draw_brass();
	}
}

module draw_clockface(){


		difference(){
			union() {
				plate();
				draw_arms();
			}
			
			front_hole();
		}
}

module wall_holder(){

	color("blue") translate([-4,63,8]) cube([strut_d,strut_d+2,strut_d+6]);
	color("blue") translate([-3,-72,8]) cube([strut_d,strut_d+2,strut_d+6]);
}
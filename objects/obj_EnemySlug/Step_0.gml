//Calculate Movement
vsp = vsp + grv;

//Horizontal Collision
if(place_meeting (x + hsp, y, obj_Ground)){
    while(!place_meeting(x + sign(hsp), y, obj_Ground)){
		x = x + sign(hsp);
	}
	hsp = -hsp;
	image_xscale = sign(-hsp);
}else{
	x  = x + hsp;
}


//Verticle Collision
if(place_meeting (x, y + vsp, obj_Ground)){
    while(!place_meeting(x, y + sign(vsp), obj_Ground)){
		y = y + sign(vsp);
	}
	vsp = 0;
}else{
   y  = y + vsp;
}

if(enemyHealth <= 0){
	hsp = 0;
	if (sprite_index == sp_EnemyDeath && image_index >= image_number - 1) {
           instance_destroy();
	    }
	
	//speed = 0;
	//sprite_index = sp_EnemyDeath;
   // image_speed = 1;
   
    //if (sprite_index == sp_EnemyDeath && image_index >= image_number - 1) {
     //  instance_destroy();
	//}

}


//Animation 
//if(hsp > 0){
//image_xscale = sign(hsp);
//}
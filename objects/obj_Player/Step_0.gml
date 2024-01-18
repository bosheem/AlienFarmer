//Get Player Input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_crouch = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);
var move = key_right - key_left;

//track last direction
if (key_left) {
    lastDirection = -1; // Left
} else if (key_right) {
    lastDirection = 1; // Right
} else if (key_crouch && place_meeting(x, y+1, obj_Ground)){
   isCrouched = true;
   hsp = 0;
}else{
	isCrouched = false;
}


//Calculate Movement
if(!isCrouched){
	hsp = move * walksp;
}else{
	hsp = 0;
}
vsp = vsp + grv;

//jump
if(place_meeting(x, y+1, obj_Ground)) && (key_jump){
	vsp = -7;
}

//Shoot Gun
firingDelay = firingDelay - 1;

if (keyboard_check(vk_shift) && (firingDelay < 0)) {
    firingDelay = 20;
	var playerHsp = other.hsp;
	var gunY = 0; 
	if(!isCrouched){
		gunY = y - 3;
	}
	else{
		gunY = y
	}
    with (instance_create_layer(x, gunY, "Bullets", obj_Bullet)) {
        speed = 10;
        if (playerHsp > 0) {
            direction = 0;  // Right
        } else if (playerHsp < 0) {
            direction = 180;  // Left
        } else{
			if(other.lastDirection >= 0){
				direction = 0;
			}
			else if(other.lastDirection < 0){
				direction = 180;
			}
		}
	}
}

//Horizontal Collision
if(place_meeting (x +hsp, y, obj_Ground)){
    while(!place_meeting(x + sign(hsp), y, obj_Ground)){
		x = x + sign(hsp);
	}
	hsp = 0;
}else{
}

x  = x + hsp;

//Verticle Collision
if(place_meeting (x, y + vsp, obj_Ground)){
    while(!place_meeting(x, y + sign(vsp), obj_Ground)){
		y = y + sign(vsp);
	}
	vsp = 0;
}

y  = y + vsp;

//Animation 
if (!place_meeting(x, y + 1, obj_Ground)){
	sprite_index = sp_PlayerJump;
	image_speed = 0; 
	if(sign(vsp) > 0 ){
		image_index = 1;
	}
	else{
		image_index = 0;
	}
}else {
	image_speed = 1;
	if(abs(hsp) > 1 && !isCrouched){
		sprite_index = sp_PlayerRun;
	}
	else if(hsp = 0 && vsp == 0 && !isCrouched){
		image_speed = 0;
		sprite_index = sp_Shoot;
	}else{
		image_speed = 0;
		sprite_index = sp_PlayerCrouch;
	}
}

if(hsp != 0){
image_xscale = sign(hsp);
}
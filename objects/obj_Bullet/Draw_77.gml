/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x, y, obj_Ground)){
	sprite_index = sp_Bullet_Explode;
	image_speed = 1;
	speed = 0;
	
	//if (image_index >= image_number - 1) {
        //instance_destroy();
    //}
}

if (sprite_index == sp_Bullet_Explode && image_index >= image_number - 1) {
        instance_destroy();
    }
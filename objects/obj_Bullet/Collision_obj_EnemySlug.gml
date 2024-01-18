if (state == "active") {
    with(other) {
        if (!damageApplied) {
            state = "inactive";
            enemyHealth -= 1;
            damageApplied = true; // Assuming you have a variable named damageApplied
		    if(enemyHealth <= 0){
			    sprite_index = sp_EnemyDeath;
			    image_speed = 1;
			    speed = 0;
				grv = 0;
			}
		}
    }

    sprite_index = sp_Bullet_Explode;
    image_speed = 1;
    speed = 0;

    if (sprite_index == sp_Bullet_Explode && image_index >= image_number - 1) {
        instance_destroy();
		with(other){
			damageApplied = false;
		}
    }
}
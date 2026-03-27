if(fall == true){       //se 'fall' é truex += random_range(-1, 1);  //tremidinha antes de cair
	fall_timer++;
	x += random_range(-1.3,1.3);
    // espera alguns frames antes de cair
    if (fall_timer > 20)
    {
        y += 5;
    }
	
	//y += 3;             //a plataforma cai
}

//plataforma saiu da tela, destruir
var _cam = camera_get_active();
if(y > camera_get_view_y(_cam) + room_height + 64){  //se tá fora da room 64px
	//show_debug_message("já era a plataforma");
	instance_destroy();                              //destrua a plataforma
}
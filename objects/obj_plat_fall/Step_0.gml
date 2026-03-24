if(fall){                     //se 'fall' é true
	fall_spd += fall_gravity; //fall_spd é incrementada com fall_gravity
	y += fall_spd;            //y incrementado com fall_spd
}

//plataforma saiu da tela, destruir
var _cam = camera_get_active();
if(y > camera_get_view_y(_cam) + room_height + 64){  //se tá fora da room 64px
	instance_destroy();                              //destrua a plataforma
}
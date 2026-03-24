//movimentos horizontais da capivara
hsp = (keyboard_check(vk_right) || keyboard_check(ord("D"))) * move_spd   //vamos para a direita
	- (keyboard_check(vk_left) || keyboard_check(ord("A"))) * move_spd;   //vamos para a esquerda
	
x += hsp;

//efeito legal: capivara sai da tela de um lado, entra do outro
if(x < 0) x = room_width;
if(x > room_width) x = 0;

//aplicando a gravidade
vsp += gravity;
y += vsp;

//plataformas: subindo -> não colide, caindo -> colide
if(vsp > 0){
	//plataforma fixa
	if(place_meeting(x, y + 1, obj_plat_fixed)){  //se caiu na plataforma fixa
		vsp = jump_force;  //receba força de pulo
	}
	
	//plataforma que cai
	if(place_meeting(x, y + 1, obj_plat_fall)){   //se caiu na plataforma que cai
		var _plat = instance_place(x, y + 1, obj_plat_fall);
		with(_plat) {fall = true}  //avisa a plataforma para cair
		vsp = jump_force;  //receba força de pulo
	}
	
	//plataforma movel
	if(place_meeting(x, y + 1, obj_plat_move)){  //se caiu na plataforma movel
		vsp = jump_force;  //receba força de pulo
	}
}

//scroll da camera
//acompanha o player, se ele sobe a camera sobe também
var _cam = camera_get_active();
var _cam_y = camera_get_view_y(_cam);

if(y < _cam_y + room_height * 0.4){
	var _diff = (_cam_y + room_height * 0.4) - y;
	camera_set_view_pos(_cam, 0, _cam_y - _diff);
	
	//para simular o movimento, todas as plataformas devem descer
	with (obj_plat_fixed) {y += _diff;}
	with (obj_plat_fall) {y += _diff;}
	with (obj_plat_move) {y += _diff;}
}

//se o player cair das plataformas
if(y > _cam_y + room_height){
	//room_goto(rm_start);
	game_restart();
}
///@description controle do movimento horizontal
//movendo a plataforma
x += hsp;

//se metade da plataforma saiu pelo lado direito → voltar
if(x > room_width + sprite_width / 2){
	hsp = -abs(hsp);
}
//se metade da plataforma saiu pelo lado esquerdo → voltar
if(x < sprite_width / 2){
	hsp = abs(hsp);
}

//saiu por baixo da tela, destruir
var _cam = camera_get_active();
if(y > camera_get_view_y(_cam) + room_height + 64){
	instance_destroy();
}
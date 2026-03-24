///@description controle do movimento horizontal
//invertendo a direção
if(x < x_left) hsp = abs(hsp);
if(x > x_right) hsp = -abs(hsp);

//saiu por baixo da tela, destruir
var _cam = camera_get_active();
if(y > camera_get_view_y(_cam) + room_height + 64){
	instance_destroy();
}
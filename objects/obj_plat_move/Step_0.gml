///@description controle do movimento horizontal
//movendo a plataforma
x += hspd;

if(x <= -3)
{
	hspd = 1;
}
else if (x >= 184)
{
	hspd = -1;
}


//saiu por baixo da tela, destruir
var _cam = camera_get_active();
if(y > camera_get_view_y(_cam) + room_height + 64){
	instance_destroy();
}
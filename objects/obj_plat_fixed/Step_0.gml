///@description
//saiu da tela, destruir
var _cam = camera_get_active();
var _cam_y = camera_get_view_y(_cam);

//se o y da plataforma é maior do que a room mais 64 pixels
if(y > _cam_y + room_height + 64){  //saiu da room + 64px
	instance_destroy();        //destrua a instância da plataforma
}

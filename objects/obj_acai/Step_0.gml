//se a plataforma de referência ainda existe e é móvel, segue ela
if (instance_exists(plat_ref) && plat_ref.object_index == obj_plat_move) {
    x = plat_ref.x; //segue o X da plataforma
    base_y = plat_ref.y - 14; //mantém a altura correta acima da plataforma
}

//flutuação suave usando seno para oscilar entre -range e +range
timer += float_speed;
y = base_y + sin(degtorad(timer)) * float_range;

//checa se o player pegou o açaí
if (place_meeting(x, y, obj_player) && !collected) {
    collected = true;

    //adiciona o valor do açaí ao contador global
    global.frutinhas += fruits;
	
	//pegou a frutinha, toque esse som
	audio_play_sound(snd_pickup, 1, false);

    //destrói a instância
    instance_destroy();
}

//se sair da tela por baixo, destruir
var _cam_y = camera_get_view_y(view_camera[0]);
if (y > _cam_y + 700 + 64) {
    instance_destroy();
}
///@description gerando plataformas
//GERAÇÃO INFINITA DE PLATAFORMAS

//pega a posição Y atual do topo da câmera no mundo
var _cam_y = camera_get_view_y(view_camera[0]);

//gera plataformas enquanto a plataforma mais alta gerada
//ainda estiver abaixo do topo da câmera + margem de antecedência
while (highest_y > _cam_y - 200) {
    highest_y -= platform_spacing;

    var _x    = random_range(32, room_width - 32);
    var _roll = irandom(2);
	var _plat = noone; //guarda a plataforma, necessário para o açaí acompanhar a plataforma movel

    if (_roll == 0)      _plat = instance_create_layer(_x, highest_y, "platforms", obj_plat_fixed);
    else if (_roll == 1) _plat = instance_create_layer(_x, highest_y, "platforms", obj_plat_fall);
    else                 _plat = instance_create_layer(_x, highest_y, "platforms", obj_plat_move);
	
	// 20% de chance de spawnar uma frutinha acima da plataforma recém criada
    if (irandom(4) == 0) {
        //instance_create_layer(_x, highest_y - 18, "platforms", obj_acai);
		var _fruit = instance_create_layer(_x, highest_y - 24, "platforms", obj_acai);
        _fruit.plat_ref = _plat; //passa a referência da plataforma para a frutinha
    }
}


// DESTRUIÇÃO DAS PLATAFORMAS QUE SAÍRAM POR BAIXO DA TELA

//como no seu sistema as plataformas NÃO se movem, precisamos destruir
//as que ficaram abaixo da câmera aqui no controller, já que a
//obj_plat_fixed não sabe onde a câmera está
var _bottom = _cam_y + camera_get_view_height(view_camera[0]) + 34;

with (obj_plat_fixed) {
    if (y > _bottom) instance_destroy();
}
with (obj_plat_fall) {
    if (y > _bottom) instance_destroy();
}
with (obj_plat_move) {
    if (y > _bottom) instance_destroy();
}
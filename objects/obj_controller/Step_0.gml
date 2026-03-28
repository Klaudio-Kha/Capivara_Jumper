// ============================================================
//  GERAÇÃO INFINITA DE PLATAFORMAS
// ============================================================

// Pega a posição Y atual do topo da câmera no mundo
var _cam_y = camera_get_view_y(view_camera[0]);

// Gera plataformas enquanto a plataforma mais alta gerada
// ainda estiver abaixo do topo da câmera + margem de antecedência
while (highest_y > _cam_y - 200) {
    highest_y -= platform_spacing;

    var _x    = random_range(32, room_width - 32);
    var _roll = irandom(2);

    if (_roll == 0)      instance_create_layer(_x, highest_y, "platforms", obj_plat_fixed);
    else if (_roll == 1) instance_create_layer(_x, highest_y, "platforms", obj_plat_fall);
    else                 instance_create_layer(_x, highest_y, "platforms", obj_plat_move);
}

// ============================================================
//  DESTRUIÇÃO DAS PLATAFORMAS QUE SAÍRAM POR BAIXO DA TELA
// ============================================================

// Como no seu sistema as plataformas NÃO se movem, precisamos destruir
// as que ficaram abaixo da câmera aqui no controller, já que a
// obj_plat_fixed não sabe onde a câmera está
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
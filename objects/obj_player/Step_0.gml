//movimentos horizontais da capivara
// ============================================================
//  MOVIMENTO HORIZONTAL
// ============================================================
hsp = (keyboard_check(vk_right) || keyboard_check(ord("D"))) * move_spd
    - (keyboard_check(vk_left)  || keyboard_check(ord("A"))) * move_spd;

x += hsp;

if (x < 0)          x = room_width;
if (x > room_width) x = 0;


// ============================================================
//  GRAVIDADE
// ============================================================
vsp += gravity;


// ============================================================
//  COLISÃO VERTICAL COM PLATAFORMAS
// ============================================================

// Só verifica colisão enquanto o player está caindo (vsp > 0).
// Checa se na posição FINAL do movimento já haverá colisão
if (place_meeting(x, y + vsp, obj_plat_fixed) && vsp > 0) {
    // Anda pixel a pixel até encostar na plataforma
    while (!place_meeting(x, y + 1, obj_plat_fixed)) {
        y += 1;
    }
    vsp = jump_force;
}

if (place_meeting(x, y + vsp, obj_plat_fall) && vsp > 0) {
    while (!place_meeting(x, y + 1, obj_plat_fall)) {
        y += 1;
    }
    var _plat = instance_place(x, y + 1, obj_plat_fall);
    with (_plat) { fall = true; }
    vsp = jump_force;
}

if (place_meeting(x, y + vsp, obj_plat_move) && vsp > 0) {
    while (!place_meeting(x, y + 1, obj_plat_move)) {
        y += 1;
    }
    vsp = jump_force;
}

// Só move Y DEPOIS de resolver a colisão
y += vsp;


// ============================================================
//  SCROLL DA CÂMERA
// ============================================================
var _cam   = camera_get_active();
var _cam_y = camera_get_view_y(_cam);

if (y < _cam_y + room_height * 0.4) {
    var _diff = (_cam_y + room_height * 0.4) - y;
    camera_set_view_pos(_cam, 0, _cam_y - _diff);

    with (obj_plat_fixed) { y += _diff; }
    with (obj_plat_fall)  { y += _diff; }
    with (obj_plat_move)  { y += _diff; }
}


// ============================================================
//  CONDIÇÃO DE DERROTA
// ============================================================
if (y > _cam_y + room_height) {
    room_goto(rm_game);
}


/*

A mudança chave foi mover o `y += vsp` para **depois** da checagem de colisão. O fluxo correto agora é:
```
1. Calcula vsp (gravidade)
2. Checa colisão e corrige vsp se necessário (pulo)
3. Aplica vsp no Y
```

Antes estava assim:
```
1. Calcula vsp
2. Aplica vsp no Y   ← player já se moveu!
3. Checa colisão     ← checa na posição errada */
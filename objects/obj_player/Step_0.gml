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
if (vsp > 0) {

    // Varre pixel a pixel a distância que o player vai percorrer neste frame.
    for (var _i = 1; _i <= ceil(vsp); _i++) {

        var _hit = noone; // guarda a instância colidida (começa como "nenhuma")
        var _type = "";   // guarda o tipo da plataforma colidida

        // Checa cada tipo de plataforma neste pixel de varredura
        if (place_meeting(x, y + _i, obj_plat_fixed)) {
            _hit  = instance_place(x, y + _i, obj_plat_fixed);
            _type = "fixed";
        } else if (place_meeting(x, y + _i, obj_plat_fall)) {
            _hit  = instance_place(x, y + _i, obj_plat_fall);
            _type = "fall";
        } else if (place_meeting(x, y + _i, obj_plat_move)) {
            _hit  = instance_place(x, y + _i, obj_plat_move);
            _type = "move";
        }

        // Se encontrou alguma plataforma neste pixel...
        if (_hit != noone) {
            y   = y + _i - 1; // reposiciona exatamente um pixel acima da colisão
            vsp = jump_force;  // aplica o pulo

            // Efeito especial da plataforma que cai
            if (_type == "fall") {
                with (_hit) { fall = true; }
            }

            break; // encerra a varredura
        }
    }
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
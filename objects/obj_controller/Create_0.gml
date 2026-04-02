//inicialize aqui para garantir que existem antes de tudo
global.frutinhas = 0;

platform_spacing = 80;       //distância vertical entre as plataformas
highest_y = room_height;     //até onde já foram criadas plataformas


//PLATAFORMA GARANTIDA EMBAIXO DO PLAYER

//busca a instância do player para saber a posição exata dele
var _player = instance_find(obj_player, 0);

//cria uma plataforma fixa centralizada, 32px abaixo dos pés do player.
//assim ele sempre vai pousar nela ao iniciar, independente de onde
//o player foi colocado na room.
if (instance_exists(_player)) {
    instance_create_layer(
        _player.x,              //mesma posição X do player
        _player.y + 32,         //32 pixels abaixo dos pés
        "platforms",
        obj_plat_fixed
    );
}


//GERAÇÃO DAS PLATAFORMAS INICIAIS (preenche a room inteira)

var _y = room_height - 60;
_y -= platform_spacing; //pula o espaço já ocupado pela plataforma garantida

while (_y > 0) {
    var _x    = random_range(32, room_width - 32);

    //no terço inferior da room só gera plataformas fixas
    //para dar uma chance justa ao player no início
    if (_y > room_height * 0.66) {
        instance_create_layer(_x, _y, "platforms", obj_plat_fixed);
    } else {
        var _roll = irandom(2);
        if (_roll == 0)      instance_create_layer(_x, _y, "platforms", obj_plat_fixed);
        else if (_roll == 1) instance_create_layer(_x, _y, "platforms", obj_plat_fall);
        else                 instance_create_layer(_x, _y, "platforms", obj_plat_move);
    }

    highest_y = _y;      //atualiza o ponteiro da plataforma mais alta
    _y -= platform_spacing;
}

//reseta highest_y para um valor acima do topo da room.
//o evento step vai continuar gerando a partir daqui conforme o player sobe
//highest_y = 0;
highest_y = camera_get_view_y(view_camera[0]);
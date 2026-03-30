///@description ao criar a capivara
//física básica
grav = 0.2;
velv = 7;
movv = 0;
velh = 1;
//sprite_index = asset_get_index("spr_" + global.skin);

cam_y = y;

//posicionando o player no inicio
x = room_width /2;
y = room_height * 0.75;

//iniciando contagem dos pontos
global.score = 0;
global.score_display = 0; //score que aparece na tela, vai "correndo" até o real

//ponto mais alto que o player já chegou
highest_y_reached = y;
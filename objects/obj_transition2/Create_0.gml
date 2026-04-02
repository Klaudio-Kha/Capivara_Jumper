///@description criando a transição
size = sprite_get_width(spr_square2);

collums = ceil(room_width / size);

lines = ceil(room_height / size);

//variável da animação
//imagem inicial
image = 0;
image_spd = sprite_get_speed(spr_square2) / game_get_speed(fps);

//comprimento da animação
//a animação tem 10 imagens, mas 9 frames, para a contagem dar certo, fazemos -1
image_tot = sprite_get_number(spr_square2) - 1;

//ao final da transição vá para:
global.target = rm_game;
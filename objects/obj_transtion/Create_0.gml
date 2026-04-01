///@description criando o meu efeito de transição de telas
//CONFIGURAÇÕES DO DIAMOND WIPE
diamond_size = 48;							 //tamanho de cada losango
cols = ceil(room_width  / diamond_size) + 2; //colunas da grade
rows = ceil(room_height / diamond_size) + 2; //linhas da grade

speed_wipe = 3;         //velocidade do efeito (pixels por frame)
wipe_x = -diamond_size; //posição X atual da "onda" de losangos

//estados: "idle", "out" (fechando), "in" (abrindo)
state = "in"; //começa abrindo ao entrar em qualquer room

draw_enabled = true; //controla se deve desenhar
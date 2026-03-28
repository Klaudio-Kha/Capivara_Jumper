//INPUT
//verifica se o jogador está pressionando direita/esquerda (teclado ou seta)
var dir = keyboard_check(ord("D")) || keyboard_check(vk_right);
var esq = keyboard_check(ord("A")) || keyboard_check(vk_left);

//calcula o movimento horizontal
var movh = (dir - esq) * velh;
//enquanto está se movendo, faz a capirava olhar para o lado certo
if (movh != 0) image_xscale = -sign(movh);

//aplica movimento horizontal ao player
x += movh;


//GRAVIDADE
if (movv < 0){           //se estiver subindo
    movv += grav;        //aplica uma gravidade suave
} else {
    movv += 2 * grav;    //se estiver caindo, aplica gravidade forte
}


//impede o player de ficar muito rápido
if (movv > 10) movv = 10;


//COLISÃO COM PLATAFORMAS
if (movv > 0 && place_meeting(x, y + movv, obj_plataforma)){
    //encosta certinho e não atravessa a plataforma
    while (!place_meeting(x, y + 1, obj_plataforma)){
        y += 1;
    }

    //pega a plataforma
    var plat = instance_place(x, y + 1, obj_plataforma);

    //aplica o pulo
    movv = -velv;

    //marca colisão
	/*
    if (plat != noone){
        plat.colidiu = true;
    }*/
	
	plat.fall = true;
} else {
    //se não colidiu com plataformas, continue caindo
	y += movv;
}

//SAIU DA ROOM, REINICIAR
if(y > room_height + 64){   //se o player saiu por baixo da tela + 64px
	game_restart();         //reinicie o jogo
}

//SCROLL da TELA
if(y < cam_y){
	cam_y = y;
}

// posição alvo da câmera
var target_y = cam_y - 160;

// posição atual da câmera
var atual_y = camera_get_view_y(view_camera[0]);

// move suavemente até o alvo
var novo_y = lerp(atual_y, target_y, 0.1);

// aplica posição
camera_set_view_pos(view_camera[0], 0, novo_y);

//camera_set_view_pos(view_camera[0], 0, cam_y - 160);

if(y > camera_get_view_y(view_camera[0]) + 380){
	game_restart();
}
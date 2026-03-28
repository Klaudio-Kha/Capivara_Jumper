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
	
    plat.fall = true;
	
    //só ganha pontos se o player está alcançando um ponto mais alto
    //que o anterior, evitando ganhar pontos pulando na mesma plataforma
    if (y < highest_y_reached) {
        var _points = floor((highest_y_reached - y) / 10);
        global.score += _points;
        highest_y_reached = y;
		
        //atualizando o max score
        if(global.score > global.max_score){
            global.max_score = global.score;
        }
    }
} else {
    //se não colidiu com plataformas, continue caindo
    y += movv;
}
//SAIU DA ROOM, REINICIAR
if(y > room_height + 64){
    global.score = 0;
    global.score_display = 0;
    highest_y_reached = y;
    game_restart();
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
if(y > camera_get_view_y(view_camera[0]) + 380){
    global.score = 0;
    global.score_display = 0;
    highest_y_reached = y;
    game_restart();
}
// ============================================================
// SCORE ROLLUP
// ============================================================
// Se o score exibido ainda não chegou ao score real, avança rapidamente
if (global.score_display < global.score) {
    var _diff = global.score - global.score_display;
    // Avança 10% da diferença por frame, mínimo de 1 ponto por frame
    // Começa rápido e desacelera suavemente ao se aproximar do valor real
    global.score_display += max(1, floor(_diff * 0.1));
    // Garante que não ultrapasse o valor real
    if (global.score_display > global.score) {
        global.score_display = global.score;
    }
}
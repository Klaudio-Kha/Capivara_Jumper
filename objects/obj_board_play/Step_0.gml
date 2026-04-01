//suavizando o movimento do botão
y = lerp(y, y_final_pos, 0.2);

//criado a tremidinha no botão
// efeito de tremidinha
if (shake_timer > 0) {
    x = x_start + irandom_range(-2, 2); // desloca aleatoriamente
    shake_timer -= 1;
    if (shake_timer == 0) {
        x = x_start; // volta ao normal
        room_goto(rm_game); // só troca de tela depois da tremidinha
    }
} else {
    x = x_start; // posição normal
}

///@description
//MÁQUINA DE ESTADOS DA TRANSIÇÃO
switch (state) {

    case "idle":
        //verifica se foi pedida uma transição
        if (global.transition_to != -1) {
            state = "out";
            wipe_x = -diamond_size;
        }
    break;

    case "out":
        //avança a onda da esquerda para a direita
        wipe_x += speed_wipe;

        //quando a onda cobriu toda a tela, troca de room
        if (wipe_x > room_width + diamond_size * 2) {
            var _dest = global.transition_to;
            global.transition_to = -1;
            room_goto(_dest);
        }
    break;

    case "in":
        //avança a onda descobrindo a tela da esquerda para a direita
        wipe_x += speed_wipe;

        //quando terminou de descobrir, volta para idle
        if (wipe_x > room_width + diamond_size * 2) {
            state = "idle";
            draw_enabled = false;
        }
    break;
}
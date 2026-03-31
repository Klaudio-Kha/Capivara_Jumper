// ============================================================
// MÁQUINA DE ESTADOS DA TRANSIÇÃO
// ============================================================
switch (state) {

    case "idle":
        // Verifica se foi pedida uma transição
        if (global.transition_to != -1) {
            state = "out";
            wipe_x = -diamond_size;
        }
    break;

    case "out":
        // Avança a onda da esquerda para a direita
        wipe_x += speed_wipe;

        // Quando a onda cobriu toda a tela, troca de room
        if (wipe_x > room_width + diamond_size * 2) {
            var _dest = global.transition_to;
            global.transition_to = -1;
            room_goto(_dest);
        }
    break;

    case "in":
        // Avança a onda descobrindo a tela da esquerda para a direita
        wipe_x += speed_wipe;

        // Quando terminou de descobrir, volta para idle
        if (wipe_x > room_width + diamond_size * 2) {
            state = "idle";
            draw_enabled = false;
        }
    break;
}
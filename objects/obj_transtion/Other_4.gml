// A cada nova room, reconfigura para abrir a tela
state = "in";
wipe_x = -diamond_size;
draw_enabled = true;

// Recalcula a grade pois a nova room pode ter tamanho diferente
cols = ceil(room_width  / diamond_size) + 2;
rows = ceil(room_height / diamond_size) + 2;
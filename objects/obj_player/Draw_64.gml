// Draw GUI desenha na tela (interface), não no mundo do jogo
// Assim o score sempre aparece no mesmo lugar independente da câmera

draw_set_font(fnt_ui);           // use uma fonte criada no GMS2
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_blue);

draw_text(16, 16, "SCORE: " + string(global.score_display));
draw_text(16, 56, "MAX: " + string(global.max_score));
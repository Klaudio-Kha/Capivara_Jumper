///@description desenha na tela (interface), não no mundo do jogo
//assim o score sempre aparece no mesmo lugar independente da câmera

//ESCOLHENDO A FONTE PADRÃO
draw_set_font(fnt_ui);

//DESENHANDO O TROFÉU E QTD DE PONTOS
//desenha o sprite do troféu na posição desejada
//sprite_index, subimage, x, y, tamX, tamY, cor, alpha
draw_sprite_ext(spr_trophy, 0, 15, 28, 1.6, 1.6, 0, c_white, 1);

//desenha a quantidade ao lado do sprite
draw_set_color(c_orange);
draw_text(32, 2, global.score_display);


//DESENHANDO AÇAÍ E QTD COLETADA
draw_set_color(c_white); // reseta a cor para não tingir o sprite

//desenha o sprite do açaí na posição desejada
//sprite_index, subimage, x, y, tamX, tamY, cor, alpha
draw_sprite_ext(spr_acai, 2, 16, 59, 1.7, 1.7, 0, c_white, 1);

//desenha a quantidade ao lado do sprite
draw_set_colour(c_navy);
draw_text(32, 30, global.frutinhas);
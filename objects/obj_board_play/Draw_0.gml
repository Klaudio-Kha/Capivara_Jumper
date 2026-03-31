draw_self();

//alinhando o texto no botão
draw_set_halign(1);  //0-esquerda, 1-centro, 2-direita
draw_set_valign(1);  //0-cima, 1-centro, 2-baixo

//fonte padrão do botão
draw_set_font(btn_font);

//definindo a cor do texto do botão
draw_set_colour(color_txt);

//resetando as configurações
draw_set_halign(-1);
draw_set_valign(-2);
draw_set_font(-1);
draw_set_colour(-1);
//
//desenhando os quadrados
for(var i = 0; i < lines; i++){
	//colunas
	for(var j = 0; j < collums; j++){
		//célula
		draw_sprite_ext(spr_square2, 8, j * size, i * size, 1, 1, 0, c_black, 1);
	}
}
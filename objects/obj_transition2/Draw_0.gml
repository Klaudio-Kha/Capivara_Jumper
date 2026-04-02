//
//desenhando os quadrados
for(var i = 0; i < lines; i++){
	//colunas
	for(var j = 0; j < collums; j++){
		//célula
		//if(image > image_tot) image = image_tot;  //garante que não passe do total de imagens
		var _img = min(max(0, image - j), image_tot);
		draw_sprite_ext(spr_square2, _img, j * size, i * size, 1, 1, 0, c_black, 1);
	}
}
//fazendo a animação da transição
image += image_spd;

//a transição terminou de preencher todas as colunas
if(image - image_tot > collums + 3){
	//show_message("Deu certo!");
	if(room_exists(global.target)){
		room_goto(global.target);
	}
}
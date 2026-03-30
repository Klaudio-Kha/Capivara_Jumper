///@description ao criar o açaí
float_speed = 3;    //velocidade da flutuação
float_range = 6;    //quantos pixels flutua para cima e para baixo
base_y = y;         //guarda a posição Y original
timer = 0;          //controla a animação
collected = false;  //evita coletar duas vezes

plat_ref = noone;   //será preenchida pelo controller se nascer numa plataforma móvel


//sorteia entre os 3 frames do açaí
//randomise();              //melhora a aleatoriedade
image_index = irandom(2);   //0, 1 ou 2
image_speed = 0;            //congela a animação no frame sorteado

//define os pontos de acordo com o frame
switch (image_index) {
    case 0: fruits = 1; break; //1 açaí
    case 1: fruits = 3; break; //cacho com 3
    case 2: fruits = 5; break; //cacho com 5
}
if (!draw_enabled) exit;


//DESENHA A GRADE DE LOSANGOS
draw_set_color(c_black);

for (var _col = 0; _col < cols; _col++) {
    for (var _row = 0; _row < rows; _row++) {

        //posição central de cada losango na grade
        var _cx = _col * diamond_size;
        var _cy = _row * diamond_size;

        //offset para linhas alternadas — dá o efeito de grade diagonal
        if (_col mod 2 == 0) _cy += diamond_size * 0.5;

        //calcula o progresso deste losango baseado na posição da onda
        //losangos mais à direita aparecem depois — cria o efeito de onda
        var _progress = (wipe_x - _cx) / diamond_size;
        _progress = clamp(_progress, 0, 1);

        //no fade-in invertemos o progresso (descobre ao invés de cobrir)
        if (state == "in") _progress = 1 - _progress;

        //tamanho atual do losango baseado no progresso
        var _half = (diamond_size * 0.5) * _progress;

        //só desenha se tiver tamanho visível
        if (_half > 0) {
            //desenha o losango como um polígono de 4 pontos
            draw_primitive_begin(pr_trianglefan);
                draw_vertex(_cx,          _cy - _half); //topo
                draw_vertex(_cx + _half,  _cy);         //direita
                draw_vertex(_cx,          _cy + _half); //baixo
                draw_vertex(_cx - _half,  _cy);         //esquerda
            draw_primitive_end();
        }
    }
}
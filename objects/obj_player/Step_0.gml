// INPUT
var dir = keyboard_check(ord("D")) || keyboard_check(vk_right);
var esq = keyboard_check(ord("A")) || keyboard_check(vk_left);

var movh = (dir - esq) * velh;
if (movh != 0) image_xscale = -sign(movh);

x += movh;


// GRAVIDADE
if (movv < 0)
{
    movv += grav;
}
else
{
    movv += 2 * grav;
}


// 🔥 LIMITADOR (ESSENCIAL)
if (movv > 10) movv = 10;


// 🔥 COLISÃO MELHORADA
if (movv > 0 && place_meeting(x, y + movv, obj_plat_fixed))
{
    // encosta certinho na plataforma
    while (!place_meeting(x, y + 1, obj_plat_fixed))
    {
        y += 1;
    }

    // pega a plataforma
    var plat = instance_place(x, y + 1, obj_plat_fixed);

    // pulo
    movv = -velv;

    // marca colisão (se quiser usar depois)
    if (plat != noone)
    {
        plat.colidiu = true;
    }
}
else
{
    y += movv;
}
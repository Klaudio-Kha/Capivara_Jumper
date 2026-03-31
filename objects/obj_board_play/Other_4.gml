//tocando música de fundo ao iniciar a room;
if(!audio_is_playing(snd_bg_music)){
	audio_play_sound(snd_bg_music, 0, 1)
}
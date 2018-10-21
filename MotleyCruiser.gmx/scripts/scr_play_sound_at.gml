//scr_play_sound_at(sound,x,y)
var snd = argument0;
var _x = argument1;
var _y = argument2;
if(!audio_is_playing(snd)){
    
    audio_play_sound_at(snd, _x, _y, 0, 100, 300, 1, false, 1);
}

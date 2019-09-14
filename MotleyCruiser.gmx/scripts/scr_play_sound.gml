/// scr_play_sound(snd,priority,loop)
var args = noone;
for (var i=0; i<4; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var snd = args[0];
var priority = args[1];
var loop = args[2];

if(priority==noone){
    priority=1;
}
if(loop==noone){
    loop=0;
}

if(!audio_is_playing(snd)){
    audio_play_sound(snd,priority,loop);
}

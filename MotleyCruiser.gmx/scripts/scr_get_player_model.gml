// scr_get_player_appearance()
var selections = noone;
selections = global.player_model;
if(selections == noone){
    selections = scr_player_model_default();
}

return selections;

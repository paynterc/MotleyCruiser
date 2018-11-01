/***
Send a bark from a specific or random crew member
***/
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}
var txt = args[0];
var crewIndex = args[1];

if(txt==""){
    return false;
}
var crewMate=noone;
if(crewIndex!=noone){
    crewMate = scr_get_array_1d(global.crew,crewIndex); 
}else{
    crewMate = scr_array_random(global.crew);  
}
var cName=noone;
var portrait = noone;
if(is_array(crewMate)){
    cName = string( scr_get_array_1d(crewMate,NPC_NAME_FIRST) );
    portrait = scr_get_array_1d(crewMate,NPC_SPRITE_TEMP);
}
if(cName == noone){
    cName="Ship AI"; 
}else{
    txt = string(cName) + ": " + txt;
}
if(!sprite_exists(portrait)){
    portrait = spr_ship_ai;
}
scr_flybark(txt,portrait,3,true);


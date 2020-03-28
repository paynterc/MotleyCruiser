/**
Contains logic to decide what requests or questions a crew member presents you with
**/
/// scr_dlg_galley_prompts(npc)
var npc = argument0;
var npcData = npc.npc_data;
var morale = scr_get_array_1d(npcData,NPC_MORALE);
show_debug_message("npc morale1 is " + string(morale));
if(morale==noone){
    morale = irandom(10);
}
show_debug_message("npc morale2 is " + string(morale));
var npcName = scr_get_array_1d(npcData,NPC_NAME);
var moraleText = npcName + "'s morale is ";
if(morale<=3){
    moraleText += " low.";
}else if(morale >= 8){
    moraleText += " high.";
}else{
    moraleText += " medium.";
}
if(debug_mode){
    moraleText += " (" +string(morale)+")";
}

// Pick a grievance
var cIndex = scr_get_array_1d(npcData,NPC_CREW_INDEX);
var G=ds_map_find_value(global.grievance_map,cIndex);// Find greivances by crew index value
var Gc=0;
if(!is_undefined(G)){
    Gc = ds_list_size(G);
}
var grv=noone;
if(Gc>0){
    // Pick random from list
    grv =  ds_list_find_value( G,  irandom_range(0, ds_list_size(G) - 1) );
}

// scr_flywriter("<" + moraleText + ">",npc.sprite_index,true,"2,OK");


if(grv==grievances.money){
    scr_flywriter("<" + moraleText + "> You're not paying me enough. I want a bigger share or I'm gone.",npc.sprite_index,true,"0,No way,Give 100 Gold");
}else if(grv==grievances.food_quality){
    scr_flywriter("<" + moraleText + "> The food is terrible. How about hiring a new cook.",npc.sprite_index,true,"1,No,Ok fine.");
}else if(grv==grievances.exhaustion){
    scr_flywriter("<" + moraleText + "> I need a rest.",npc.sprite_index,true,"2,Rest when you're dead,Rest for 1 day.");
}else if(grv==grievances.cleanliness){
    scr_flywriter("<" + moraleText + "> This place is a mess.",npc.sprite_index,true,"3,Meh..,Clean.");
}else if(grv==grievances.loneliness){
    scr_flywriter("<" + moraleText + "> I'm lonely. I want a pet.",npc.sprite_index,true,"4,What? No.,Ok.");
}else{
    var resp = choose(
    "I'm ok",
    "How's it hangin",
    "Everything's fine rigt now.",
    "Not much going on.",
    "You don't have to check in with me.",
    "Just lost in my own thoughts.",
    "I'm ready for something to happen.",
    "Don't you have anything better to do?"
    );

    scr_flywriter("<" + moraleText + "> "+resp,npc.sprite_index,true,"10,Ok.");
}

// ask to be taken to a planet
// ask for a pet
// ask for a piece of equipment




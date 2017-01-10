//scr_change_location(type,index,new_sector_row, new_sector_col, new_home_type, new_home_index)
var type = argument0;
var g_index = real(argument1);
var newrow = argument2;
var newcol = argument3;
var new_type = argument4;
var new_type_index = argument5;
var entity = noone;
var oldlocation = noone;

var newloc_string = new_type + "," + string(new_type_index) + "," + string(newrow) + "," + string(newcol);

// Only works for npcs right now
if(type=="npc"){
    
    if(g_index >= array_length_1d(global.npcs)){
        return false;
    }
    entity = global.npcs[g_index];
    oldlocation = entity[NPC_LOCATION];
    entity[@ NPC_LOCATION] = newloc_string;
     
}else{
    return false;
}

var loc = scr_str_split(oldlocation,",");
var oldtype = loc[0];
var oldindex = loc[1];
var oldrow = loc[2];
var oldcol = loc[3];

var old1 = noone;
// Remove from old location
if(oldtype=="planet"){
    old1 = global.planets[oldindex];
    old1[@ PLANET_NPCS] = scr_array_remove(old1[PLANET_NPCS],g_index); 
}else if(oldtype=="moon"){
    old1 = global.planets[oldindex];
    old1[@ MOON_NPCS] = scr_array_remove(old1[MOON_NPCS],g_index);
}else if(oldtype=="station"){
    old1 = global.planets[oldindex];
    old1[@ STATION_NPCS] = scr_array_remove(old1[STATION_NPCS],g_index);
}

// Remove from old sector
var oldsector = global.galaxy[oldrow,oldcol];
oldsector[@ SECTOR_NPCS] = scr_array_remove(oldsector[SECTOR_NPCS],g_index);

// Add to new location
var new1 = noone;
if(new_type=="planet"){
    new1 = global.planets[new_type_index];
    new1[@ PLANET_NPCS] = scr_push_array(old1[PLANET_NPCS],g_index); 
}else if(new_type=="moon"){
    new1 = global.moons[new_type_index];
    new1[@ MOON_NPCS] = scr_push_array(old1[MOON_NPCS],g_index); 
}else if(new_type=="station"){
    new1 = global.stations[new_type_index];
    new1[@ STATION_NPCS] = scr_push_array(old1[STATION_NPCS],g_index); 
}

// Add to new sector
var newsector = global.galaxy[newrow,newcol];
newsector[@ SECTOR_NPCS] = scr_push_array(newsector[SECTOR_NPCS],g_index);



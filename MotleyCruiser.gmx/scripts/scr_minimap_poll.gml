/***
Poll the sector to see if any locations should be added to the minimap
****/
// scr_minimap_poll()


with(obj_sun){
    if(!discovered && scr_instance_in_view(id)){
        discovered = true;
       scr_sector_map_add(x,y,"sun");
    }
}

with(obj_planet){
    if(!discovered && scr_instance_in_view(id)){
        discovered = true;
        scr_sector_map_add(x,y,"planet");
    }
}

with(obj_station){
    if(scr_instance_in_view(id)){
        discovered = true;
        scr_sector_map_add(x,y,"station");
    }
}

with(obj_moon){
    if(!discovered && scr_instance_in_view(id)){
        discovered = true;
        scr_sector_map_add(x,y,"moon");
    }
}

with(obj_asteroid){
    if(!discovered && scr_instance_in_view(id)){
        discovered = true;
        scr_sector_map_add(x,y,"asteroid");
    }
}

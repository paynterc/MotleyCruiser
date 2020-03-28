/// scr_toggle_nav_map()
if(room!=rm_galaxy_map){
       global.room_return = room;
       room_goto(rm_galaxy_map);
}else if(room==rm_galaxy_map){
    if( room_exists(global.room_return) && global.room_return!=rm_galaxy_map ){
        room_goto(global.room_return);
    }else{
        room_goto(rm_space);
    }
}

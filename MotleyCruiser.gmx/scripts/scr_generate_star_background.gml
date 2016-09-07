/// Create the level


for (var i=1;i<20000;i++){
    col = make_color_rgb(irandom(255), irandom(255), irandom(255));
    //draw_set_colour(c_yellow);
    //draw_point(irandom(room_width),irandom(room_height));
    //surface_reset_target();
    
    theTile = tile_add(bg_star, 0, 0, 3, 3, irandom(room_width), irandom(room_height), 3000);
    tile_set_blend(theTile,col);
}

//if (show_question("Would you like to load a room")){
 
// var key = get_string("What is the name of the room?", "default");
// ini_open("Save.ini");
// var seed = ini_read_real("Rooms", key, 0);
// random_set_seed(seed);

//}else{
// Randomize the world
//    randomize();
//}



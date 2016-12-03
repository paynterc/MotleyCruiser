/// scr_get_path_to_point. x and y can be 
// xx = (obj_player.x div CELL_WIDTH)* CELL_WIDTH + CELL_WIDTH/2
// yy = (obj_player.y div CELL_HEIGHT)* CELL_HEIGHT + CELL_HEIGHT/2
var xx = argument[0];
var yy = argument[1];
var pspeed = argument[2];
if( mp_grid_path(global.grid_path, path, x, y, xx, yy, true) ){
    path_start(path, pspeed, path_action_stop, false);
}

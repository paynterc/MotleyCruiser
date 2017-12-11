/// scr_tutorial_dostep(step)
var step = argument0;
if(!is_array(global.tutorial)){
    return false;
}

return scr_get_array_1d(global.tutorial,step) == false;



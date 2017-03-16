/// Who has the ball?
//scr_gui_set_context(string)
var has_ball = argument0;//string
if(instance_exists(obj_gui_control)){
    obj_gui_control.had_ball = obj_gui_control.has_ball;
    obj_gui_control.has_ball = has_ball;
}

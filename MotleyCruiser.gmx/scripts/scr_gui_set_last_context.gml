/// Who had the ball last?
//scr_gui_set_context(string)
var had_ball = argument0;//string
if(instance_exists(obj_gui_control)){
    obj_gui_control.had_ball = had_ball;
}

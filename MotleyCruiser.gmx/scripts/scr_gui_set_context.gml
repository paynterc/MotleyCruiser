/// Who has the ball?
//scr_gui_set_context(object)
var has_ball = argument0;//object
if(instance_exists(obj_gui_control)){

    if(obj_gui_control.has_ball!=noone){    

        with(obj_gui_control){
            ds_stack_push(ui_stack, obj_gui_control.has_ball);
        }
    }
    
    obj_gui_control.has_ball = has_ball;
    obj_gui_control.has_ball.depth = -1000000;
    with(obj_gui_control){
        event_user(1);//show active window
    }

}

//scr_gui_return_context();
if( instance_exists(obj_gui_control) ){
    
    with(obj_gui_control){
        if !ds_stack_empty(ui_stack){
            has_ball = ds_stack_pop(ui_stack);
        }else{
            has_ball=noone;
        }
        event_user(1);
    }
    
    
}

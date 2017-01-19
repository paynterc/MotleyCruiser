///scr_display_message(text,script)
if(instance_exists(obj_message_box)){
    obj_message_box.raw_text = argument0;
    obj_message_box.script = argument1;
    with(obj_message_box){
        event_user(0);
        show=true;
    }
}

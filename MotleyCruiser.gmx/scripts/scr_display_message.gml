///scr_display_message(text,script)
if(instance_exists(obj_message_box)){
    obj_message_box.raw_text = argument0;
    obj_message_box.script = argument1;
    scr_gui_set_context(obj_message_box);
}

// scr_event_fire(event)
if(debug_mode){ show_debug_message("DEBUG: Firing event " + string(argument[0])) }
with(obj_eventmanager){
    var ev = argument[0];

    if(ds_map_exists(eventMap, ev)){
        // Get listeners
        var listenerList = eventMap[? ev];
        var len = ds_list_size(listenerList);
        var listenerInfo, listener, script, scriptArgs;

        var i=len-1;
        repeat(len){

            listenerInfo=listenerList[| i];// [id, scr_pickup_item, ["sword", true]]
            listener = listenerInfo[0];
            script = listenerInfo[1];
            scriptArgs = listenerInfo[2];

            if(instance_exists(listener)){
                with(listener){
                    scr_script_parse_array(script,scriptArgs);    
                }
            }
            i--;
        }
    }
}

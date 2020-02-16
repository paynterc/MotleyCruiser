/// scr_event_fire(event,arguments)
if(debug_mode){ show_debug_message("DEBUG: Firing event " + string(argument[0])) }

var ev = argument[0];
var args2 = noone;
for (var i=1; i<argument_count; i++)
{
    args2[i-1] = argument[i];
}

var check = 1;
with(obj_eventmanager){

    if(ds_map_exists(eventMap, ev)){
        // Get listeners
        var listenerList = eventMap[? ev];
        var len = ds_list_size(listenerList);
        var listenerInfo, listener, script, args1;

        var i=len-1;
        repeat(len){

            listenerInfo=listenerList[| i];// [id, scr_pickup_item, ["sword", true]]
            listener = listenerInfo[0];
            script = listenerInfo[1];
            args1 = listenerInfo[2];
            check = 1;
            var args1Length = array_length_1d(args1);
            check = 1;
            // Add additional arguments from the firing instance
            for(var i = 0; i < array_length_1d(args2); i++) {
                args1[array_length_1d(args1)] = args2[i];
            }

            check = 1;
            if(instance_exists(listener)){
                with(listener){
                    scr_script_parse_array(script,args1); 
                }
            }
            i--;
        }
    }
}

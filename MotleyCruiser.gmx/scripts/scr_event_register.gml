// scr_event_register(event, instanceId, script, args)
var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}
if(debug_mode){ show_debug_message("DEBUG: Registering event " + string(args[0])) }
with(obj_eventmanager){
    var ev=args[0];// This would be a value from the event enum above. Using this as a key.
    var instanceId = args[1];
    var script = args[2];
    var scriptArgs = args[3];//Should be an array
    if(!ds_map_exists(eventMap,ev)){
        // Add event
        var listenerList = ds_list_create();
        ds_map_add_list(eventMap,ev,listenerList);// Using ds_map_add_list allows all lists to be destroyed at once

    } else {
        var listenerList = eventMap[? ev];
    }

    // Add listenerInfo
    var listenerInfo=noone;// to be an array

    // Add listenerId
    listenerInfo[0]=instanceId;
    listenerInfo[1]=script;
    listenerInfo[2]=scriptArgs;//an array of arguments
    ds_list_add(listenerList, listenerInfo);
}

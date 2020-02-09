// scr_event_unregister(event,instanceId)
with(obj_eventmanager){
    var ev = argument0;
    var inst = argument1;
    if(ds_map_exists(eventMap, ev)){
        var listenerList = eventMap[? ev];
        var len = ds_list_size(listenerList);
        for(var i=0; i<len; i++){
            var listenerInfo = listenerList[| i];
            if(listenerInfo[0]==inst){
                if(len==1){
                    ds_list_destroy(listenerList);
                    ds_map_delete(eventMap, ev);
                }else{
                    ds_list_delete(listenerList,i);
                }
                break;
            }
        }
    }
}

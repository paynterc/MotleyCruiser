/// scr_queue_bark(text, sprite_index)
if(instance_exists(obj_bark_queue)){
    var data = noone;
    data[0]=argument0;
    data[1]=argument1;
    with(obj_bark_queue){
        ds_queue_enqueue(queue, data); 
    }
}

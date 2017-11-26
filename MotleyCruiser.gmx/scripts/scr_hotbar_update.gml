/// scr_hotbar_update(type,increment)
/*****
Update inventory count of each hotbar item
*****/
var type = argument0;
var increment = argument1;

if(!is_array(global.hotbar)){
    scr_hotbar_init();
}

var hot_counts = noone;
var hot_sprites = noone;



var amt = 0;
var hsprite;
var iid;
for(var i=0; i<array_height_2d(global.hotbar);i++){
    
    if(global.hotbar[i,0]==type){
        var amt = global.hotbar[i,1] + increment;       
        global.hotbar[i,1] = clamp(amt, 0, global.hotbar[i,3]);
    }

}

//global.hot_counts = hot_counts;
//global.hot_sprites = hot_sprites;

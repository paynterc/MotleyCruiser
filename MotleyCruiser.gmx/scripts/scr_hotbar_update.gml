/*****
Update inventory count of each hotbar item
*****/
//scr_hotbar_update()
if(global.hotbar=noone){
    scr_hotbar_init();
}

var hot_counts = noone;
var hot_sprites = noone;
var amt = 0;
var hsprite;
for(var i=0; i<array_length_1d(global.hotbar);i++){
    amt = 0;
    hsprite = noone;
    if(global.hotbar[i]!=noone){
        amt = scr_inv_item_count(global.hotbar[i]);
        hsprite = item_id_read(global.hotbar[i],2);
    }
    hot_counts[i] = amt;
    hot_sprites[i] = hsprite;
}

global.hot_counts = hot_counts;
global.hot_sprites = hot_sprites;

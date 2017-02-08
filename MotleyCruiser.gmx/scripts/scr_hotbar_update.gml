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
var iid;
for(var i=0; i<array_height_2d(global.hotbar);i++){
    amt = 0;
    hsprite = noone;
    iid = global.hotbar[i,0];
    if(iid!=noone){
        amt = scr_inv_item_count(iid);
        hsprite = item_id_read(iid,2);
    }
    global.hotbar[i,1] = amt;
    global.hotbar[i,2] = hsprite;
}

//global.hot_counts = hot_counts;
//global.hot_sprites = hot_sprites;

/// scr_hotbar_count(type)
/*****
Update inventory count of each hotbar item
*****/
var type = argument0;

if(global.hotbar=noone){
    scr_hotbar_init();
}


var amt = 0;

for(var i=0; i<array_height_2d(global.hotbar);i++){
    
    if(global.hotbar[i,0]==type){
        amt = global.hotbar[i,1];       
        break;
    }

}

return amt;

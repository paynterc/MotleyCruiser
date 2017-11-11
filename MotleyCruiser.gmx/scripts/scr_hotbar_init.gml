/**********
Create an array with the inventory id for each hotslot
***********/

var hotbar=noone;

hotbar[0,0]="heal";//itemid
hotbar[0,1]=5;//count
hotbar[0,2]=spr_ItemIcon_medkit;//sprite
hotbar[0,3]=5;//max


hotbar[1,0]="grenade";//itemid
hotbar[1,1]=5;//count
hotbar[1,2]=spr_ItemIcon_Grenade;//sprite
hotbar[1,3]=10;//max

//global.hot_counts=noone;
//global.hot_sprites=noone;

global.hotbar = hotbar;


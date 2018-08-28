/**********
Initialize a ds_map with comodities for trade.

Economy types
0 Aggriculture
1 Mining
2 Industrial
3 Tech

Commodity types
food, 
**********/
// scr_commoities_int

global.commodity_library = ds_map_create();

var idx=0;// record index
scr_commodity_lib_add(idx,0,"Food") //Title
scr_commodity_lib_add(idx,1,CC_AGRICULTURE) //Comodity Class (Economy Type)
scr_commodity_lib_add(idx,2,spr_ItemIcon_Fruit) //Sprite
scr_commodity_lib_add(idx,3,"Food for eatin.") //Description
scr_commodity_lib_add(idx,4,100) //Base price
scr_commodity_lib_add(idx,5,"default") //Type: default, special


var idx=1;// record index
scr_commodity_lib_add(idx,0,"Oxygen") //Title
scr_commodity_lib_add(idx,1,CC_AGRICULTURE) //Comodity Class (Economy Type)
scr_commodity_lib_add(idx,2,spr_ItemIcon_GasBlue) //Sprite
scr_commodity_lib_add(idx,3,"Air for breathin.") //Description
scr_commodity_lib_add(idx,4,100) //Base price
scr_commodity_lib_add(idx,5,"default") //Type: default, special

var idx=2;// record index
scr_commodity_lib_add(idx,0,"Minerals") //Title
scr_commodity_lib_add(idx,1,CC_MINING) //Comodity Class (Economy Type)
scr_commodity_lib_add(idx,2,spr_ItemIcon_OreStone) //Sprite
scr_commodity_lib_add(idx,3,"Useful raw materials.") //Description
scr_commodity_lib_add(idx,4,100) //Base price
scr_commodity_lib_add(idx,5,"default") //Type: default, special

var idx=3;// record index
scr_commodity_lib_add(idx,0,"Water") //Title
scr_commodity_lib_add(idx,1,CC_MINING) //Comodity Class (Economy Type)
scr_commodity_lib_add(idx,2,spr_ItemIcon_Water) //Sprite
scr_commodity_lib_add(idx,3,"Water, mined from asteroids and commets. Everybody needs it.") //Description
scr_commodity_lib_add(idx,4,100) //Base price
scr_commodity_lib_add(idx,5,"default") //Type: default, special

var idx=4;// record index
scr_commodity_lib_add(idx,0,"Fuel") //Title
scr_commodity_lib_add(idx,1,CC_INDUSTRIAL) //Comodity Class (Economy Type)
scr_commodity_lib_add(idx,2,spr_ItemIcon_BigDefPotion) //Sprite
scr_commodity_lib_add(idx,3,"Makes spaceships go.") //Description
scr_commodity_lib_add(idx,4,100) //Base price
scr_commodity_lib_add(idx,5,"default") //Type: default, special

var idx=5;// record index
scr_commodity_lib_add(idx,0,"Hardware") //Title
scr_commodity_lib_add(idx,1,CC_INDUSTRIAL) //Comodity Class (Economy Type)
scr_commodity_lib_add(idx,2,spr_ItemIcon_Bottle2) //Sprite
scr_commodity_lib_add(idx,3,"Necessary for building ships and equipment.") //Description
scr_commodity_lib_add(idx,4,100) //Base price
scr_commodity_lib_add(idx,5,"default") //Type: default, special

var idx=6;// record index
scr_commodity_lib_add(idx,0,"Medicine") //Title
scr_commodity_lib_add(idx,1,CC_TECH) //Comodity Class (Economy Type)
scr_commodity_lib_add(idx,2,spr_ItemIcon_Pills) //Sprite
scr_commodity_lib_add(idx,3,"Makes you better.") //Description
scr_commodity_lib_add(idx,4,100) //Base price
scr_commodity_lib_add(idx,5,"default") //Type: default, special

var idx=7;// record index
scr_commodity_lib_add(idx,0,"Luxury Goods") //Title
scr_commodity_lib_add(idx,1,CC_TECH) //Comodity Class (Economy Type)
scr_commodity_lib_add(idx,2,spr_ItemIcon_BeerBucket) //Sprite
scr_commodity_lib_add(idx,3,"Good for morale.") //Description
scr_commodity_lib_add(idx,4,100) //Base price
scr_commodity_lib_add(idx,5,"default") //Type: default, special

global.commodity_lib_count = idx+1;

/// scr_instantiate_cantina(data)
/***********
Create a cantina area using stored data. 
***********/
var data = argument0;// metadata for the dock
var gwidth = room_width div CELL_WIDTH;
var gheight = room_height div CELL_HEIGHT;
var gx = gwidth div 2;
var gy = gheight div 2;

// data
var W = data[rmm.w];
var H = data[rmm.h];

//CENTER VIEW. Convert grid coordinates to room coords by multiplying by CELL_WIDTH
var cx = (gx * CELL_WIDTH) + ( (W/2) * CELL_WIDTH );
var cy = (gy * CELL_HEIGHT)  + ( (H/2) * CELL_HEIGHT );
var rx = gx * CELL_WIDTH;
var ry = gy * CELL_HEIGHT;


// MAIN ROOM STAMP
scr_stamp_rectangle(gx,gy,H,W);

// ENTRANCE/EXIT STAMP
var exX=gx + ceil(W/2) -1;
var exY=gy + H;
scr_stamp_rectangle(exX,exY,1,1);
scr_stamp_rectangle(exX-1,exY+1,3,3);
var exitDoor = instance_create( exX * CELL_WIDTH + (CELL_WIDTH/2), (exY+4) * CELL_HEIGHT + (CELL_WIDTH/2),obj_airlock);
exitDoor.room_to = "rm_galley"// Room to load. Must be text.
exitDoor.display_side = "bottom";

// Place bar. Should be 3rd row from top. Max width = W -2. Min = 3
scr_stamp_rectangle(gx+2,gy+1,1,W-4,WALL);
//scr_stamp_rectangle(gx+2,gy-1,1,W-4,BARBACK);
scr_add_tiles(gx+2,gy+1,bg_bartop,W-4,1);
scr_add_tiles(gx+2,gy-1,bg_barshelf,W-4,1);
var barX1 = (gx+2) * CELL_WIDTH;
var barX2 = barX1 + ((W-4) * CELL_WIDTH);
var barY1 = (gy+1) * CELL_HEIGHT;
var barY2 = barY1 + 14;

// Drinks. Randominze this, should be different every time
for(var i=0;i<irandom(W-4)+1;i++){
    var drink = instance_create(irandom_range(barX1,barX2),irandom_range(barY1+1,barY2),obj_drink);
    drink.depth=-10000;
}

// Add some signage
var signData = scr_get_array_1d(data,rmm.signs);
var checkpoint = 1;
if(signData!=noone){
    for(var sc=0; sc<array_length_1d(signData); sc++){
        
        var sn = signData[sc];
        var mod1spr = scr_get_array_1d(sn,rm_sign.sprIdx);
        var sgX = scr_get_array_1d(sn,rm_sign.gridX);// sign x coord
        var sgY = scr_get_array_1d(sn,rm_sign.gridY);// sign y coord
    
        var mod1 = instance_create(((gx+sgX) * CELL_WIDTH) + (CELL_WIDTH/2), ((gy+sgY) * CELL_HEIGHT) + (CELL_HEIGHT/2),obj_sign);
        mod1.sprite_index = scr_get_array_1d(scr_room_signs(),mod1spr);
        mod1.depth=-100000 - mod1.y;
        mod1.image_speed *= .20;
        mod1.drawbg = false;
    }
}



// Room objects
var stGX = gx;// Stage grid x
var stGY = gy;
var roomObjects = scr_get_array_1d(data,rmm.objects);
var checkpoint = 1;
if(roomObjects != noone){
    for(var i=0;i<array_length_1d(roomObjects);i++){
        var objData = roomObjects[i];
        if(is_array(objData)){
            var obj = scr_get_array_1d(scr_room_objects(),objData[0]);// first index of objData will be the index of the room object library

            if(obj!=noone){
                instance_create(rx+objData[1], ry+objData[2], obj);
            }           
        }
    }
}

if(instance_exists(obj_stage)){
    stGX = obj_stage.x
    stGY = obj_stage.y;
}
// Get the boundaries of the stage so we can place musicians.
var stXx1 = stGX * CELL_WIDTH +(CELL_WIDTH/2);
var stYy1 = stGY * CELL_HEIGHT;
var stXx2 = stXx1 + (CELL_WIDTH*3) - (CELL_WIDTH/2);
var stYy2 = stYy1 + (CELL_HEIGHT*2);
// Persistent NPCs
var npcs = scr_get_array_1d(data,rmm.npcs);
var npcObject, npc_data;
if(npcs != noone){
    for(var i=0;i<array_length_1d(npcs);i++){
        var npc_data = npcs[i];       
        npcObject = instance_create(cx, cy, obj_npc);
        npcObject.npc_data = npc_data;
        with(npcObject){
            scr_npc_map_to_object();            
        }       
        if(npc_data[NPC_OCCUPATION]==14){
            // Bartender
            npcObject.y = gy * CELL_HEIGHT + (CELL_HEIGHT/2) + 8;
            npcObject.mode = "discourse";
            
        }else if(npc_data[NPC_OCCUPATION]==13){
            // Musicians
            npcObject.default_weapon = choose(obj_instrument,obj_instrument,obj_bass);
            with(npcObject){
                depth=-100000;
                scr_npc_map_to_object();
                mode = "discourse";
                x=irandom_range(stXx1,stXx2);
                y=irandom_range(stYy1,stYy2);
                while(place_meeting(x, y, obj_npc)){
                    x=irandom_range(stXx1,stXx2);
                    y=irandom_range(stYy1,stYy2);
                }
                event_user(0);//Equip instrument!
            }
            
        }
        
    }
}

with(obj_table){
    if(place_meeting(x,y,obj_stage)){
        instance_destroy();
    }else{
        event_user(0);
    }
}

// Rifraf
for(var flX=gx; flX<=gx+W-1; flX++){
    for(var flY = gy+2; flY<=gy+H-1; flY++){

        var npcOdds = 15;
        if( irandom(npcOdds) == npcOdds ){
            npcObject = instance_create(flX * CELL_WIDTH + (CELL_WIDTH/2), flY * CELL_HEIGHT, obj_npc);
            npc_data = scr_gx_make_npc(global.sector_x,global.sector_y);      
            npcObject.npc_data = npc_data;
            with(npcObject){
                scr_npc_map_to_object();
                mode = "discourse";
            }          
        }
    }
}

// Instantiate player and crew
instance_create(cx,cy,obj_player);

// Center VIEW
view_xview[0] = cx  - (view_wview[0]/2);
view_yview[0] = cy  - (view_hview[0]/2);

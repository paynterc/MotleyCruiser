/// scr_loc_instantiate_dock(data)
/***********

Create a port area with merchant trader and shipwright. 
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

var npcObject, npc_data;

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
// Gangway
var gngX=gx-7;
var gngY=gy+(ceil(H/2))-1;
scr_add_tiles(gngX,gngY,bg_gangway,W+14,1,2);

// Door 1 - top-center - to cantina
exX = gx + floor(W/2);
exY = gy -1;
var cantinaDoor = instance_create( exX * CELL_WIDTH + (CELL_WIDTH/2), exY * CELL_HEIGHT + (CELL_WIDTH/2),obj_airlock);
cantinaDoor.interact_active = true;

// PLAYER
instance_create(cx,cy,obj_player);

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
        if(npc_data[NPC_OCCUPATION]==15){
        
            npcObject.x = ( (gx+1) * CELL_WIDTH ) + (CELL_WIDTH/2);
            npcObject.y = gy * CELL_HEIGHT + (CELL_HEIGHT/2) + 8;
            npcObject.mode = "discourse";
            npcObject.is_trader = true;
            
        }else if(npc_data[NPC_OCCUPATION]==16){
        
            npcObject.x = (gx+W-2) * CELL_WIDTH + (CELL_WIDTH/2);
            npcObject.y = gy * CELL_HEIGHT + (CELL_HEIGHT/2) + 8;
            npcObject.mode = "discourse";
            npcObject.is_shipwright = true;
            
        }
        
    }
}

// RANDOM
randomize();

// Random DOCKED SHIPS
var dockedShip;
var dsScale = 128/CELL_WIDTH;
var dsX = gx-dsScale-1;
var dsY = gy+1;
dockedShip = instance_create(dsX*CELL_WIDTH,dsY*CELL_HEIGHT,obj_docked_ship);
dsY = gy+H-1;
dockedShip = instance_create(dsX*CELL_WIDTH,dsY*CELL_HEIGHT,obj_docked_ship);
// right side
dsX = gx+W+dsScale+1;dsY = gy+1;
dockedShip = instance_create(dsX*CELL_WIDTH,dsY*CELL_HEIGHT,obj_docked_ship);
dockedShip.image_xscale *=-1;
dsY = gy+H-1;
dockedShip = instance_create(dsX*CELL_WIDTH,dsY*CELL_HEIGHT,obj_docked_ship);
dockedShip.image_xscale *=-1;




// Random Customers and rifraf
for(var flX=gx; flX<=gx+W-1; flX++){
    for(var flY = gy+2; flY<=gy+H-1; flY++){
        var tblOds = 10;
        if( irandom(tblOds) == tblOds ){
            var npcOdds = 2;
            if(irandom(npcOdds)==npcOdds){
                npcObject = instance_create(flX * CELL_WIDTH + (CELL_WIDTH/2), flY * CELL_HEIGHT, obj_npc);
                npc_data = scr_gx_make_npc(0,0);      
                npcObject.npc_data = npc_data;
                with(npcObject){
                    scr_npc_map_to_object();
                    mode = "discourse";
                } 
            }         
        }else{
            var jnkOdds = 6;
            if(irandom(jnkOdds)==jnkOdds){
                instance_create(flX * CELL_WIDTH + (CELL_WIDTH/2), flY * CELL_HEIGHT, obj_dock_junk);
            }
        }
    }
}



// Center VIEW
view_xview[0] = cx  - (view_wview[0]/2);
view_yview[0] = cy  - (view_hview[0]/2);



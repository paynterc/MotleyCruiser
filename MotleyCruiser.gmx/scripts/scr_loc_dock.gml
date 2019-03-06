/// scr_loc_cantina(x,y)
/***********
gx,gy are GRID LOCATIONS, NOT room coords. upper left corner

Stations and starports will be modular. The cantina is the central module with npcs
that grant missions or tips. Also likely a trade vendor.

Create a port area with merchant trader and shipwright. 
***********/
var gx = argument0;
var gy = argument1;

// data
var W = 7;
var H = 7;

//CENTER VIEW. Convert grid coordinates to room coords by multiplying by CELL_WIDTH
var cx = (gx * CELL_WIDTH) + ( (W/2) * CELL_WIDTH );
var cy = (gy * CELL_HEIGHT)  + ( (H/2) * CELL_HEIGHT );

var npcObject, npc_data

// MAIN ROOM STAMP
scr_stamp_rectangle(gx,gy,H,W);

// ENTRANCE/EXIT STAMP
var exX=gx + ceil(W/2) -1;
var exY=gy + H;
scr_stamp_rectangle(exX,exY,1,1);
scr_stamp_rectangle(exX-1,exY+1,3,3);
instance_create( exX * CELL_WIDTH + (CELL_WIDTH/2), (exY+4) * CELL_HEIGHT + (CELL_WIDTH/2),obj_airlock);

// Gangway
var gngX=gx-7;
var gngY=gy+(ceil(H/2))-1;
scr_add_tiles(gngX,gngY,bg_gangway,W+14,1,2);

// DOCKED SHIPS
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




// exit 1 - top-center - to cantina
exX = gx + floor(W/2);
exY = gy -1;
//scr_stamp_rectangle(exX-2,exY,1,3);
instance_create( exX * CELL_WIDTH + (CELL_WIDTH/2), exY * CELL_HEIGHT + (CELL_WIDTH/2),obj_airlock);


var npcObject, npc_data;
// data
// Create a merchant. Should be same character every time
npcObject = instance_create(( (gx+1) * CELL_WIDTH ) + (CELL_WIDTH/2), gy * CELL_HEIGHT + (CELL_HEIGHT/2) + 8, obj_npc);
npc_data = scr_gx_make_npc(0,0);
npc_data[NPC_OCCUPATION]=13;// merchant. see scr_npc_occupation_library      
npcObject.npc_data = npc_data;
with(npcObject){
    scr_npc_map_to_object();
    mode = "discourse";
    is_trader = true;
}
var merchantIcon = instance_create(0,0,obj_npc_icon);
merchantIcon.sprite_index = spr_trade_icon;
merchantIcon.myNpc = npcObject;

// data
// Create a shipwright. Should be same character every time
npcObject = instance_create((gx+W-2) * CELL_WIDTH+ (CELL_WIDTH/2), gy * CELL_HEIGHT + (CELL_HEIGHT/2) + 8, obj_npc);
npc_data = scr_gx_make_npc(0,0);
npc_data[NPC_OCCUPATION]=14;    
npcObject.npc_data = npc_data;
with(npcObject){
    scr_npc_map_to_object();
    mode = "discourse";
    is_shipwright = true;
}





instance_create(cx,cy,obj_player);


// Customers and rifraf
// Floor space should be below the bar.

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



// Center on the bartender?
view_xview[0] = cx  - (view_wview[0]/2);
//view_yview[0] = gy * CELL_HEIGHT + (CELL_HEIGHT/2)  - (view_hview[0]/2);
view_yview[0] = cy  - (view_hview[0]/2);

//view_xview[0]= ((gx * CELL_WIDTH) + ((W * CELL_WIDTH)/2)) - (view_wview[0]/2);
//view_yview[0]= ((gy * CELL_HEIGHT) + ((H * CELL_WIDTH)/2)) - (view_hview[0]/2);

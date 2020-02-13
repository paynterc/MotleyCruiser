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
var exitDoor = instance_create( exX * CELL_WIDTH + (CELL_WIDTH/2), (exY+4) * CELL_HEIGHT + (CELL_HEIGHT*1.5),obj_airlock);
exitDoor.room_to = "rm_galley"// Room to load. Must be text.
exitDoor.display_side = "bottom";
exitDoor.depth = depths.ceilingBottom -1;
// Gangway
var gngX=gx-7;
var gngY=gy+(ceil(H/2))-1;
scr_add_tiles(gngX,gngY,bg_gangway,W+14,1,2);

// Door 1 - top-center - to cantina
exX = gx + floor(W/2);
exY = gy -1;
var cantinaDoor = instance_create( exX * CELL_WIDTH + (CELL_WIDTH/2), (exY * CELL_HEIGHT) + (CELL_HEIGHT*1.5),obj_airlock);
cantinaDoor.interact_active = true;
cantinaDoor.room_to = "rm_cantina1"// Room to load. Must be text.
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
        if(npc_data[NPC_OCCUPATION]==occupation.merchant){
        
            npcObject.x = ( (gx+1) * CELL_WIDTH ) + (CELL_WIDTH/2);
            npcObject.y = gy * CELL_HEIGHT + (CELL_HEIGHT/2) + 8;
            npcObject.mode = "discourse";
            npcObject.is_trader = true;
            
        }else if(npc_data[NPC_OCCUPATION]==occupation.shipwright){
        
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
            var jnkOdds = 15;
            if(irandom(jnkOdds)==jnkOdds){
                instance_create(flX * CELL_WIDTH + (CELL_WIDTH/2), flY * CELL_HEIGHT, obj_dock_junk);
            }
        }
    }
}



var locServices = scr_get_array_1d(global.landed_on,LOC_SERVICES);

//if(locServices != noone){
if(1==1){
//scr_in_array(locServices,services.pet_store)
    if(1==1){
        // Carpet for pet vendor
        tile_add(bg_carpet1, 0, 0, CELL_WIDTH*2, CELL_WIDTH*2, (gx+1) * CELL_WIDTH, (gy+H-3) * CELL_HEIGHT, depths.floorTile-1);
        
        var pets=array_create(4);
        for(var i=0;i<4;i++){
            pets[i]=choose("obj_pet1","obj_pet2","obj_pet3","obj_pet4","obj_pet5");
        }
        
        var petData, thePet;
        petData = scr_pet(pets[0],'noname',0);
        thePet = scr_instantiate_pet(0,0,petData);
        scr_center_instance_on_cell(gx+1,gy+H-3,thePet);
        
        petData = scr_pet(pets[1],'noname',0);
        thePet = scr_instantiate_pet(0,0,petData);
        scr_center_instance_on_cell(gx+2,gy+H-3,thePet);
        
        petData = scr_pet(pets[2],'noname',0);
        thePet = scr_instantiate_pet(0,0,petData);
        scr_center_instance_on_cell(gx+1,gy+H-2,thePet);
        
        petData = scr_pet(pets[3],'noname',0);
        thePet = scr_instantiate_pet(0,0,petData);
        scr_center_instance_on_cell(gx+2,gy+H-2,thePet);
        
        with(obj_dock_junk){
            if(place_meeting(x,y,obj_pet)){
                instance_destroy();
            }
        }
        
        with(obj_npc){
            if(place_meeting(x,y,obj_pet)){
                scr_center_instance_on_cell(gx+3,gy+H-4,self);
            }
        }
    }
}



// Center VIEW
view_xview[0] = cx  - (view_wview[0]/2);
view_yview[0] = cy  - (view_hview[0]/2);



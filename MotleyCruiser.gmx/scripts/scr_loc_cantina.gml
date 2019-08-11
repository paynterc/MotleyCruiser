/// scr_loc_cantina(x,y)
/***********
gx,gy are GRID LOCATIONS, NOT room coords. upper left corner

Stations and starports will be modular. The cantina is the central module with npcs
that grant missions or tips. Also likely a trade vendor.

Create random dimensions for the cantina. 
***********/
var gx = argument0;
var gy = argument1;

// data
var W = choose(7,9,11,13);
var H = choose(7,9,11,13);

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

// Up to 4 side rooms. 2 left 2 right. Black market, gambling, shipwright, outfitter. see scr_loc_add_services

// data
var svcCount = irandom(3)+1;// Count of available services in side rooms. TODO: Set services via external script

if(svcCount>0){
    // exit 1 - upper left
    exX=gx;
    exY=gy -1;
    //scr_stamp_rectangle(exX-2,exY,1,3);
    instance_create( exX * CELL_WIDTH + (CELL_WIDTH/2), exY * CELL_HEIGHT + (CELL_WIDTH/2),obj_airlock);
}

if(svcCount>1){
    // exit 2 - upper right
    exX=gx+W-1;
    exY=gy-1;
    //scr_stamp_rectangle(exX,exY,1,3);
    //scr_stamp_rectangle(exX+1,exY-1,3,3);
    instance_create( exX * CELL_WIDTH + (CELL_WIDTH/2), exY * CELL_HEIGHT + (CELL_WIDTH/2),obj_airlock);
}

if(svcCount>2){
    // exit 3 lower right
    exX=gx+W-1;
    exY=gy+H;
    //scr_stamp_rectangle(exX,exY,1,3);
    //scr_stamp_rectangle(exX+1,exY-1,3,3);
    instance_create( exX * CELL_WIDTH + (CELL_WIDTH/2), exY * CELL_HEIGHT + (CELL_WIDTH/2),obj_airlock);
}

if(svcCount>3){
    // exit 4 lower left
    exX=gx;
    exY=gy+H;
    //scr_stamp_rectangle(exX-2,exY,1,3);
    //scr_stamp_rectangle(exX-3,exY-1,3,3);
    instance_create( exX * CELL_WIDTH + (CELL_WIDTH/2), exY * CELL_HEIGHT + (CELL_WIDTH/2),obj_airlock);
}




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


// data
// Create a bartender. Should be same every time
npcObject = instance_create(cx, gy * CELL_HEIGHT + (CELL_HEIGHT/2) + 8, obj_npc);
npc_data = scr_gx_make_npc(0,0);
npc_data[NPC_OCCUPATION]="bartender";       
npcObject.npc_data = npc_data;
with(npcObject){
    scr_npc_map_to_object();
    mode = "discourse";
}
instance_create(cx,cy,obj_player);

// data
// Add some signage
var sgX;// sign x coord
var sgY;// sign y coord
for(var sc=0; sc<irandom( H ); sc++;){
    var lr = irandom(1);
    if(lr==0){
        sgX = gx-1;// left
    }else{
        sgX = gx+W;
    }
    sgY = irandom_range(gy+1, gy+H-2);
    
    var mod1spr = choose(spr_sign1, spr_sign3, spr_sign4, spr_sign6, spr_sign7);
    var szMod = 1;
    var sprH = sprite_get_height(mod1spr) * szMod;
    var sprW = sprite_get_height(mod1spr) * szMod;
    var cellCount = ceil(sprW/CELL_WIDTH);

    var mod1 = instance_create((sgX * CELL_WIDTH) + (CELL_WIDTH/2), (sgY * CELL_HEIGHT) + (CELL_HEIGHT/2),obj_sign);
    mod1.sprite_index = mod1spr;
    mod1.depth=-1000 - mod1.y;
    mod1.image_speed *= .20;
    mod1.drawbg = false;
}



// STAGE
var stGX = gx + irandom(W-3);
var stGY =gy + ((H+1)/2) - 1;// Grid Y
//scr_stamp_rectangle(stGX,stGY,3,3,BG_PLATFORM);
var stage = instance_create(stGX * CELL_WIDTH, stGY * CELL_HEIGHT, obj_stage);
// Musicians
var mCount = irandom(5)+2;
mm=1;
var stXx1 = stGX * CELL_WIDTH +(CELL_WIDTH/2);
var stYy1 = stGY * CELL_HEIGHT;
var stXx2 = stXx1 + (CELL_WIDTH*3) - (CELL_WIDTH/2);
var stYy2 = stYy1 + (CELL_HEIGHT*2);
while(mm<=mCount){
    
    npcObject = instance_create(cx, gy * CELL_HEIGHT + (CELL_HEIGHT/2) + 8, obj_npc);
    npc_data = scr_gx_make_npc(0,0);
    npc_data[NPC_OCCUPATION]="musician";       
    npcObject.npc_data = npc_data;
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
    mm++
}

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
            }else{
                var tbl = instance_create(flX * CELL_WIDTH + (CELL_WIDTH/2), flY * CELL_HEIGHT + (CELL_HEIGHT/4), obj_table);
                with(tbl){
                    event_user(0);
                }
            }           
        }
    }
}
with(obj_table){
    if(place_meeting(x,y,obj_stage)){
        instance_destroy();
    }
}


// Center on the bartender?
view_xview[0] = cx  - (view_wview[0]/2);
//view_yview[0] = gy * CELL_HEIGHT + (CELL_HEIGHT/2)  - (view_hview[0]/2);
view_yview[0] = cy  - (view_hview[0]/2);

//view_xview[0]= ((gx * CELL_WIDTH) + ((W * CELL_WIDTH)/2)) - (view_wview[0]/2);
//view_yview[0]= ((gy * CELL_HEIGHT) + ((H * CELL_WIDTH)/2)) - (view_hview[0]/2);

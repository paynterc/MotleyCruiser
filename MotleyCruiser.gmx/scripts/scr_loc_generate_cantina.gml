/// scr_loc_generate_cantina()
// Generate random data for a station cantina
var rm = scr_ent_room();// Room data entity
randomize();
var W = choose(7,9,11,13);
var H = choose(7,9,11,13);
rm[rmm.seed]=random_get_seed();
rm[rmm.w]=W;
rm[rmm.h]=H;
rm[rmm.type]=room_types.cantina;

var gx=0;// Starting grid locations. Everything else is positioned relative to this.
var gy=0;

// pick up to three unique services
var svcCount = irandom(3)+1;
var svcArraySource = scr_new_array();
var svcArrayChosen = scr_new_array();
for(var i=0; i<services.LENGTH;i++){
    scr_push_array_1d(svcArraySource,i);
}
for(var i=0;i<=svcCount;i++){
    var svc = scr_array_random(svcArraySource);
    scr_push_array_1d(svcArrayChosen,svc);
    svcArraySource = scr_array_remove(svcArraySource,svc);
}
rm[rmm.services]=svcArrayChosen;


// Add some signage
var sign_sprites = scr_room_signs();
var sgX;// sign x coord
var sgY;// sign y coord
var signArray = noone;

for(var sc=0; sc<irandom( H ); sc++){
    var sign_data = scr_ent_room_sign();
    var lr = irandom(1);
    if(lr==0){
        sgX = gx-1;// left
    }else{
        sgX = gx+W;
    }
    sgY = irandom_range(gy+1, gy+H-2);
    sign_data[rm_sign.gridX] = sgX; 
    sign_data[rm_sign.gridY] = sgY; 
    sign_data[rm_sign.sprIdx] = irandom(array_length_1d(sign_sprites)-1);
    signArray=scr_push_array(signArray,sign_data);

}
rm[rmm.signs]=signArray;

// NPCs
var bartender = scr_gx_make_npc(global.sector_x,global.sector_y);
bartender[NPC_OCCUPATION]=14;// bartender. see scr_npc_occupation_library
rm[rmm.npcs]=scr_array(bartender);

// Band
if(scr_in_array(svcArrayChosen,services.band)){

    // STAGE
    var stGX = gx + (irandom(W-3) * CELL_WIDTH);// xx
    var stGY = gy + ((((H+1)/2) - 1) * CELL_HEIGHT);// yy
    var objArray = scr_array(0,stGX,stGY);/// Index of object from scr_room_objects(), gridx, gridy.
    rm[rmm.objects]=scr_push_array(rm[rmm.objects],objArray);
    
    var mCount = irandom(4)+1;
    var mm=1;
       
    while(mm<=mCount){        
        var npc_data = scr_gx_make_npc(global.sector_x,global.sector_y);
        npc_data[NPC_OCCUPATION]=13;// scr_npc_occupation_library()
        scr_push_array_1d(rm[rmm.npcs],npc_data);
        mm++;
    }
}

// Tables
for(var flX=1; flX<=W-1; flX++){
    for(var flY = 2; flY<=gy+H-1; flY++){
        var tblOds = 10;
        if( irandom(tblOds) == tblOds ){
            var tblData = scr_array(1,(flX * CELL_WIDTH) + (CELL_WIDTH/2),(flY * CELL_WIDTH) + (CELL_WIDTH/4));
            rm[rmm.objects]=scr_push_array(rm[rmm.objects],tblData);
        }
    }
}

return rm;

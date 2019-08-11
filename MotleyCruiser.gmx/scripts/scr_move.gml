///move(hspd,vspd)
if(global.paused) return false;


var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var hspd = args[0];
var vspd = args[1]
var useMPgrid = args[2];
if(useMPgrid==noone){
    useMPgrid=0;
}

if(useMPgrid==1){
    // Horizonal collisions
    if(scr_mpgrid_place_meeting(x+hspd,y)){
    
        while(!scr_mpgrid_place_meeting(x+sign(hspd),y) ){
            x += sign(hspd);     
        }
        hspd = 0;
    }
    
    if(scr_mpgrid_place_meeting(x,y+vspd)){
    
        while(!scr_mpgrid_place_meeting(x,y+sign(vspd)) ){
            y += sign(vspd);
        }
        vspd = 0;
    }
}else{
    // Horizonal collisions
    if(scr_grid_place_meeting(x+hspd,y)){
    
        while(!scr_grid_place_meeting(x+sign(hspd),y) ){
            x += sign(hspd);     
        }
        hspd = 0;
    }
    
    if(scr_grid_place_meeting(x,y+vspd)){
    
        while(!scr_grid_place_meeting(x,y+sign(vspd)) ){
            y += sign(vspd);
        }
        vspd = 0;
    }
}



//Move H
x+=hspd;


// Vertical collisions

//Move V
y+=vspd;

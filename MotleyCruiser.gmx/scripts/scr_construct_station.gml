/// scr_construct_station(x,y)
/*****
Build a random station out of modules
*****/
var xx = argument0;
var yy = argument1;
var orX = xx;
var orY = yy;
var mod1,mod1spr,dir,xdir,ydir,sprW,sprH;
var sdir,dist,sgn,rsgn,sgnSprt,odds1,odds2;
var accSpr,accRot,accMod,accX,accY,dir2,accW,accH;
var stationData = noone;// An array to keep track of sprites and coordinates. array( array(library section, library index, x offset, y offset),...)


// Get the library of modules
var station_modules = scr_station_modules();
var mainModules = station_modules[0];
var subModules = station_modules[1];
var signModules = station_modules[2];
var antennaModules = station_modules[3];

// Pick a central module

// Instantiate
mod1 = instance_create(xx,yy,obj_station_module);
var idxMod = irandom( array_length_1d(mainModules) - 1 );
stationData[0]=scr_array(0,idxMod,0,0);
mod1spr = mainModules[idxMod];
mod1.sprite_index = mod1spr;
sprW = sprite_get_width(mod1spr);
sprH = sprite_get_height(mod1spr);
mod1.depth=10000;

var numMod = irandom(7)+2;
for(var i=0;i<numMod;i++){
    
    dir = irandom(3);
    if(dir == 0){
        xdir=-1;ydir=0;// Left
    }else if(dir==1){
        xdir=0;ydir=-1;// Up
    }else if(dir==2){
        xdir=1;ydir=0;// Right
    }else{
        xdir=0;ydir=1;// Down
    }

    // Add a module
    odds1 = 3;    
    if(irandom(odds1)== odds1){
    
        idxMod = irandom( array_length_1d(signModules) - 1 );
        mod1spr = signModules[idxMod];
        xx = xx + ( ( (sprW/2) + (sprite_get_width(mod1spr)/2) ) * xdir);
        yy = yy + ( ( (sprH/2) + (sprite_get_height(mod1spr)/2) ) * ydir);
        stationData = scr_push_array(stationData, scr_make_station_data(orX,orY,2,idxMod,xx,yy) );
        
        mod1 = instance_create(xx,yy,obj_sign);
        mod1.sprite_index = mod1spr;
        mod1.depth=-1000;
        mod1.image_speed *= .20;
        mod1.image_xscale = 2;
        mod1.image_yscale = 2;
        
    }else{
    
        idxMod = irandom( array_length_1d(subModules) - 1 );
        mod1spr = subModules[idxMod];
        xx = xx + ( ( (sprW/2) + (sprite_get_width(mod1spr)/2) ) * xdir);
        yy = yy + ( ( (sprH/2) + (sprite_get_height(mod1spr)/2) ) * ydir);
        stationData = scr_push_array( stationData,scr_make_station_data(orX,orY,1,idxMod,xx,yy) );
        
        mod1 = instance_create(xx,yy,obj_station_module);
        mod1.sprite_index = mod1spr;
        mod1.depth=1000;
        
        odds2=2;
        if( irandom(odds2)==odds2 ){
            
            idxMod = irandom( array_length_1d(antennaModules) - 1 );
            accSpr = antennaModules[idxMod];
            accW = sprite_get_width(accSpr);
            accH = sprite_get_height(accSpr);
            dir2 = irandom(3);
            if(dir2 == 0){ // Left
                accX = xx - ( sprite_get_width(mod1spr)/2 ) - (accH/2);
                accY=yy;
                accRot=90;
            }else if(dir2==1){ // up
                accX = xx;
                accY=yy - ( sprite_get_height(mod1spr)/2 ) - (accH/2);
                accRot=0;
            }else if(dir2==2){ // Right
                accX = xx + ( sprite_get_width(mod1spr)/2 ) + (accH/2);
                accY=yy;
                accRot=270;
            }else{// Down
                accX = xx;
                accY=yy + ( sprite_get_height(mod1spr)/2 ) + (accH/2);
                accRot=180;
            }
                   
            var accMod = instance_create(accX,accY,obj_station_module);
            accMod.sprite_index = accSpr;
            accMod.depth=2000;
            accMod.image_angle = accRot;
            stationData = scr_push_array( stationData,scr_make_station_data(orX,orY,3,idxMod,accX,accY) );
            
        }
           
    }
    sprW = sprite_get_width(mod1spr);
    sprH = sprite_get_height(mod1spr);



}

// return last cooridinates
return stationData;


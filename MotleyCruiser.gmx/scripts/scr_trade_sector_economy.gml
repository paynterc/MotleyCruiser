/***********
Calculates impact of all economy types in the sector. 
Having too many agrarian economies will lower the value
of agrarian goods.
***********/
//scr_trade_sector_economy(exclude_landed)
var exclude_landed = argument0;// boolean
if(global.galaxy == noone){
    return false;
}

var counts=noone;
counts[0]=0;//agriculture
counts[1]=0;//mining
counts[2]=0;//industrial
counts[3]=0;//tech

var g_row = global.current_sector_row;
var g_col = global.current_sector_col;

var sector = global.galaxy[g_row,g_col];

var stations = sector[SECTOR_STATIONS]; //This should be a list of indexes that you can use to cross-reference with global.stations.
var planets = sector[SECTOR_PLANETS];
var moons = sector[SECTOR_MOONS];

var thisloc=noone;
if(is_array(stations)){

    for(var i=0; i<array_length_1d(stations); i++){
    
        if(!stations[i] || ( exclude_landed && global.landed_type=='station' && stations[i]==global.landed_on ) ){
            continue;
        }
        
        thisloc=global.stations[stations[i]];
        if( thisloc!=noone && thisloc[STATION_ECONOMY]>=0 && thisloc[STATION_ECONOMY]<=array_length_1d(counts) ){
            counts[thisloc[STATION_ECONOMY]]++;
        }       
    }
}

thisloc=noone;
if(is_array(planets)){
    for(var i=0; i<array_length_1d(planets); i++){
        if(!planets[i] || ( exclude_landed && global.landed_type=='planet' && planets[i]==global.landed_on ) ){
            continue;
        }
        
        thisloc=global.planets[planets[i]];
        if(thisloc!=noone && thisloc[PLANET_ECONOMY]>=0 && thisloc[PLANET_ECONOMY]<=array_length_1d(counts) ){
            counts[thisloc[PLANET_ECONOMY]]++;
        }       
    }
}

thisloc=noone;
if(is_array(moons)){
    for(var i=0; i<array_length_1d(moons); i++){
        if(!moons[i] || ( exclude_landed && global.landed_type=='moon' && moons[i]==global.landed_on )){
            continue;
        }
    
        thisloc=global.moons[moons[i]];
        if(thisloc!=noone && thisloc[MOON_ECONOMY]>=0 && thisloc[MOON_ECONOMY]<=array_length_1d(counts) ){
            counts[thisloc[MOON_ECONOMY]]++;
        }       
    }
}

/*****
[0]1
[1]3
[2]0
[3]4
*****/
return counts;

/// Create a 2d array of the galaxy

global.galaxy = noone;
global.suns=noone;
global.planets=noone;
global.moons=noone;
global.stations=noone;
global.ships=noone;
global.npcs=noone;

global.galaxy[0,0]=-1;
global.suns[0] = -1;
global.planets[0] = -1;
global.moons[0] = -1;
global.stations[0] = -1;
global.ships[0] = -1;
global.npcs[0] = -1;

var gwidth = global.galaxy_width;
var row=0;
var col=0;


var suns = noone;
var suncount = 0;
var sunmax = 2;

var stations = noone;
var stationcount = 0;
var stationmax = 2;

var planets = noone;
var planetcount = 0;
var planetmax = 3;

var moons = noone;
var mooncount = 0;
var moonmax = 2;

var npcs = noone;
var npccount = 0;
var npcmax = 5;

var i=0;
var sector = noone;

var sun = noone;
var planet = noone;
var moon = noone;
var npc = noone;

var location_npcs = noone;



for(row=0; row < gwidth; row++){
    
    for(col=0; col < gwidth; col++){
        // Reset sector
        suns=noone;
        stations=noone;
        planets=scr_new_array();      
        moons=scr_new_array();
        npcs=scr_new_array();
        sector = noone;
        

        suncount = irandom_range(0,sunmax);
        for(i=0; i<suncount; i++){          
            
            sun=scr_make_sun(row,col);
            var sun_index = scr_push_array_1d(global.suns,sun);
            suns[i]=sun_index; // Sector suns
            
            
            
            planetcount = irandom_range(0,planetmax);
            var sun_planets = noone;//an array of planet indexes to add to the sun record
            for(var p=0; p<planetcount; p++){
                planet=scr_make_planet(row,col,0);
                var planet_index = scr_push_array_1d(global.planets,planet);// Add planet to the global db of planets
                scr_update_array_1d(global.planets[planet_index],PLANET_SUN,sun_index);
                
                scr_push_array_1d(planets,planet_index);// Add planet index to sector planets
                sun_planets[p]=planet_index;
                
                //Add some npcs to the planet
                npccount = irandom_range(0,npcmax);
                location_npcs = noone;
                for(var n=0; n < npccount; n++){

                    npc = scr_make_npc("planet" + "," + string(planet_index) + "," + string(row) + "," + string(col));
                    npc_index = scr_push_array_1d(global.npcs,npc);
                    var gnpc = global.npcs[npc_index];
                    location_npcs[n]=npc_index;
                    scr_push_array_1d(npcs,npc_index);
                }
                scr_update_array_1d(global.planets[planet_index],PLANET_NPCS,location_npcs);
                
                
                
                // Add some moons to the planet
                mooncount = irandom_range(0,moonmax);
                var planet_moons = noone;
                for(var m=0; m < mooncount; m++){
                    moon=scr_make_moon(row,col,0);
                    var moon_index = scr_push_array_1d(global.moons,moon);// Add moon to the global db of moons
                    scr_update_array_1d(global.moons[moon_index],MOON_PLANET,planet_index);
                    
                    scr_push_array_1d(moons,moon_index);// Add moon index to sector moons
                    planet_moons[m]=moon_index;
                    
                    //Add some npcs to the moon
                    npccount = irandom_range(0,npcmax);
                    location_npcs = noone;
                    for(var n=0; n < npccount; n++){
                        npc = scr_make_npc("moon" + "," + string(moon_index) + "," + string(row) + "," + string(col));
                        npc_index = scr_push_array_1d(global.npcs,npc);
                        location_npcs[n]=npc_index;
                        scr_push_array_1d(npcs,npc_index);
                    }
                    scr_update_array_1d(global.moons[moon_index],MOON_NPCS,location_npcs);

                }
                scr_update_array_1d(global.planets[planet_index],PLANET_MOONS,planet_moons);
                
                
            }
            
            scr_update_array_1d(global.suns[sun_index],SUN_PLANETS,sun_planets);
                     
        }

        
        stationcount = irandom(stationmax);
        for(i=0; i<stationcount; i++){
            station=scr_make_station(row,col,0);
            var station_index = scr_push_array_1d(global.stations,station);
            stations[i]=station_index;
            
            //Add some npcs to the station
            npccount = irandom_range(0,npcmax);
            location_npcs = noone;
            for(var n=0; n < npccount; n++){
                npc = scr_make_npc("station" + "," + string(station_index) + "," + string(row) + "," + string(col));
                npc_index = scr_push_array_1d(global.npcs,npc);
                location_npcs[n]=npc_index;
                scr_push_array_1d(npcs,npc_index);
            }
            scr_update_array_1d(global.stations[station_index],STATION_NPCS,location_npcs);       
            
        }
              
        sector[SECTOR_SUNS]=suns;
        sector[SECTOR_PLANETS]=planets;
        sector[SECTOR_MOONS]=moons;
        sector[SECTOR_NPCS]=npcs;
        sector[SECTOR_STATIONS]=stations;
                             
        global.galaxy[row,col] = sector;
        
    }
}
//Index the npcs
var gnpc;
for(var i=0; i<array_length_1d(global.npcs); i++){
    gnpc = global.npcs[i];
    gnpc[@ NPC_GLOBAL_INDEX]=i;
}

//Index the planets
var gp;
for(var i=0; i<array_length_1d(global.planets); i++){
    gp = global.planets[i];
    gp[@ PLANET_GLOBAL_INDEX]=i;
}

//Index the moons
var gm;
for(var i=0; i<array_length_1d(global.moons); i++){
    gm = global.moons[i];
    gm[@ MOON_GLOBAL_INDEX]=i;
}

//Index the stations
var gstat;
for(var i=0; i<array_length_1d(global.stations); i++){
    gstat = global.stations[i];
    gstat[@ STATION_GLOBAL_INDEX]=i;
}

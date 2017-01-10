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

var fc = noone;// Faction centers
//2d array with x,y coords
fc[0,0]=0;// x coord
fc[0,1]=0;// y coord
fc[0,2]=FACTION_CRYPTOLID;// FACTION
fc[0,3]=(gwidth/2)+2;// RANGE

fc[1,0]=gwidth-1;// x coord
fc[1,1]=0;// y coord
fc[1,2]=FACTION_ZOMBOID;// FACTION
fc[1,3]=(gwidth/2)+2;// RANGE

fc[2,0]=0;// x coord
fc[2,1]=gwidth-1;// y coord
fc[2,2]=FACTION_PIRATE;// FACTION
fc[2,3]=(gwidth/2)+2;// RANGE

fc[3,0]=gwidth-1;// x coord
fc[3,1]=gwidth-1;// y coord
fc[3,2]=FACTION_ANTINOID;// FACTION
fc[3,3]=(gwidth/2)+2;// RANGE

fc[4,0]=gwidth/4;// x coord
fc[4,1]=gwidth/2;// y coord
fc[4,2]=FACTION_FEDERATION;// FACTION
fc[4,3]=(gwidth/2);// RANGE

fc[5,0]=gwidth - (gwidth/4);// x coord
fc[5,1]=gwidth/2;// y coord
fc[5,2]=FACTION_EMPIRE;// FACTION
fc[5,3]=(gwidth/2);// RANGE

global.faction_centers = fc;

var faction_races = noone;
faction_races[FACTION_CRYPTOLID,0]=9;// Cryptolid

faction_races[FACTION_ZOMBOID,0]=10;// Zomboid

faction_races[FACTION_ANTINOID,0]=11;// Antinoid

faction_races[FACTION_PIRATE,0]=0;// xx
faction_races[FACTION_PIRATE,1]=1;// xx
faction_races[FACTION_PIRATE,2]=2;// xx
faction_races[FACTION_PIRATE,3]=3;// xx
faction_races[FACTION_PIRATE,4]=4;// xx
faction_races[FACTION_PIRATE,5]=8;// xx

faction_races[FACTION_FEDERATION,0]=0;// xx
faction_races[FACTION_FEDERATION,1]=1;// xx
faction_races[FACTION_FEDERATION,2]=2;// xx

faction_races[FACTION_EMPIRE,0]=0;// xx
faction_races[FACTION_EMPIRE,1]=3;// xx
faction_races[FACTION_EMPIRE,2]=4;// xx

global.faction_races = faction_races;

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
                planet=scr_make_planet(row,col);
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
                    moon=scr_make_moon(row,col);
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
            station=scr_make_station(row,col);
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

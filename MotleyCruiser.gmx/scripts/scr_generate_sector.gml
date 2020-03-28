/// scr_generate_sector(sector x, sector y)
// Generate (or regenerate) random data for a sector.

var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var sx = args[0];
var sy = args[1];
if(sx==noone || sy==noone){
    sx=global.sector_x;
    sy=global.sector_y;
}

var gxindex = 0; // Use this to generate a dsmap index for each location.

var sector_seed = scr_gx_get_by_key(sx,sy,"seed");
if(is_undefined(sector_seed)){
    // We haven't been here yet. Create a new sector and add it to the map.
    randomize();
    scr_gx_save_by_key(sx,sy,"seed",random_get_seed());         
}else{
    random_set_seed(sector_seed);
}

var bodies = scr_gx_get_by_key(sx,sy,"bodies");
if(is_undefined(bodies)){
    //Build and store sector data
    bodies = scr_new_array();
      
    // ECONOMY. Just a count of each type of economy in the sector:
    // agriculture, mining, industrial, tech
    global.sector_economy = noone;
    global.sector_economy = scr_array(0,0,0,0);// Set all counts to zero.
    //global.sector_map=scr_galaxy_map_find_sector(sx,sy);
    global.sector_landable_count=0;
    
    var curdepth = 1000;

    var c;// count of suns
    var sun, moon, planet, station;// data arrays
    var sun_obj, moon_obj, planet_obj, station_obj;// instantiated objects
    
    
    /*********************
    RANDOM STUFF HAPPENS HERE.
    ***************/
    
    if(sx == 0 && sy == 0){
        // Home sector. This is where we start the game. Somewhat random, but always a planet and a sun.
        
        var center_x = global.sector_width/2;
        var center_y = global.sector_width/2;
    
        c = irandom(3);
        // Home system
        sun = scr_make_sun(sx,sy);
        var sw = sprite_get_width(spr_sun) * 3;
        sun[SUN_X1]=center_x-(sw/2);
        sun[SUN_Y1]=center_y-(sw/2);
        sun[SUN_W1]=sw;
        sun[LOC_DISCOVERED]=false;
        sun[LOC_LANDABLE]=false;
        sun[LOC_HAS_PORT]=false;         
        scr_push_array_1d(bodies,scr_gx_bodies_add(sun));
        
          
        planet = scr_make_moon(sx,sy,gxindex);
        planet[LOC_TYPE]=GX_PLANET;
        planet[LOC_X1]=center_x;
        planet[LOC_Y1]=center_y;
        planet[LOC_W1]=sprite_get_width(spr_planet) * 2;
        planet[LOC_ECONOMY]=CC_AGRICULTURE;
        planet[LOC_TERRAIN]=terrains.forest;
        planet[LOC_IMAGE_DATA]=scr_planet_imagedata_generator(planet);
        planet[LOC_DESCRIPTION]=scr_planet_description_generator(planet);
        planet[LOC_DISCOVERED]=true;
        planet[LOC_LANDABLE]=true;
        planet[LOC_HAS_PORT]=true;        
        //scr_push_array_1d(bodies,planet);
        scr_push_array_1d(bodies,scr_gx_bodies_add(planet)); 
         
        global.sector_economy[CC_AGRICULTURE] += 1;
        
        gxindex++;
        
        global.sector_landable_count=1;
        
        scr_gx_save_by_key(sx,sy,"bodies",bodies);
        
    }else{
    
        // Generate a totally new sector
    
        var mainLandable = false;// We will have one landable place at the center of the map. Keep track of whether we have placed it yet using this variable.
        // Add suns
        c = irandom(3);
        
        for(var i=0; i<c; i++){
          sun = scr_make_sun(sx,sy);
          sun_obj = instance_create(sun[SUN_X1],sun[SUN_Y1],obj_sun);
          scr_push_array_1d(bodies,scr_gx_bodies_add(sun));
          //scr_gx_bodies_add(sun);
          gxindex++;           
        }
             
        var LL = 3; //landable limit. TODO: Make this a global
        var system_landables = irandom(LL);        
        show_debug_message("total suns: " + string(c));
        show_debug_message("total landables: " + string(system_landables));
        
        var canMakeMoon=false;
        // There won't be planets or moons if there are no suns
        if(c>0){ 
            // Add planets
            c = irandom(system_landables);
            
            for(var i=0; i<c; i++){
                planet = scr_make_planet(sx,sy,gxindex);
                show_debug_message("make planet");
                if(!mainLandable){
                    mainLandable=true;
                    planet[LOC_X1] = global.sector_width/2;
                    planet[LOC_Y1] = global.sector_width/2;
                }
                // global.sector_economy[planet[LOC_ECONOMY]] += 1;// Maybe generate the economy when you instantiate the object
            
                scr_push_array_1d(bodies,scr_gx_bodies_add(planet));
                gxindex++;
                canMakeMoon=true;               
            }
            
            system_landables-=c;      
            if(system_landables>0 && canMakeMoon){
                // Add moons
                c = irandom(system_landables);
                for(var i=0; i<c; i++){
                    moon = scr_make_moon(sx,sy,gxindex);
                    show_debug_message("make moon");
                    if(!mainLandable){
                        mainLandable=true;
                        moon[LOC_X1] = global.sector_width/2;
                        moon[LOC_Y1] = global.sector_width/2;
                    }
                    
                    //global.sector_economy[moon[LOC_ECONOMY]] += 1;
                    scr_push_array_1d(bodies,scr_gx_bodies_add(moon));
                    gxindex++;
                    
                }
                system_landables-=c;
            }
        
        }
        
        if(system_landables>0){
            // Add stations
            var c = irandom(system_landables);
            for(var i=0; i<c; i++){
                station = scr_make_station(sx,sy,gxindex);
                show_debug_message("make station");
                if(!mainLandable){
                    mainLandable=true;
                    station[LOC_X1] = global.sector_width/2;
                    station[LOC_Y1] = global.sector_width/2;
                    show_debug_message("make station as main landable");
                }
                
                global.sector_economy[station[LOC_ECONOMY]] += 1;
                scr_push_array_1d(bodies,scr_gx_bodies_add(station));
                            
                gxindex++;
                
            }
        }
        
        // Maybe some mining areas
        for(var i=0;i<irandom(5);i++){
            //scr_mining_area(noone,noone);
        }
        
        // Save the celestial bodies data into the galaxy dsmap
        scr_gx_save_by_key(sx,sy,"bodies",bodies);
        
        
        /*********************
        END SEEDED RANDOMIZATION. ADDING ANYTHING RANDOM ABOVE THIS POINT COULD CHANGE THE SAVED MAP.
        ***************/
        
    }
   
}

/// scr_instantiate_sector()
var sx = global.sector_x;
var sy = global.sector_y;

// ECONOMY. Just a count of each type of economy in the sector:
// agriculture, mining, industrial, tech
global.sector_economy = noone;
global.sector_economy = scr_array(0,0,0,0);// Set all counts to zero.

global.sector_landable_count=0;
//global.sector_map=scr_galaxy_map_find_sector(sx,sy);
var curdepth = 1000;

var bodies = scr_gx_get_by_key(sx,sy,"bodies");
if(!is_undefined(bodies)){

    // Loop through the data and instantiate all the objects.
    var obj1, size_mod;
    for(var i=0;i<array_length_1d(bodies);i++){
        
        var body = bodies[i];
        if(body==-1 || body==noone){
            continue;
        }
        if(body[LOC_TYPE]==GX_SUN){
            
            obj1 = instance_create(body[LOC_X1],body[LOC_Y1],obj_sun);
            obj1.data = body;
            size_mod = body[LOC_W1] / sprite_get_width(spr_sun);
            with(obj1){                 
                image_xscale = size_mod;
                image_yscale = size_mod;
                image_blend = data[LOC_COLOR];
                depth = curdepth;
                faction = FACTION_NEUTRAL;
            }
                                  
        }else if( body[LOC_TYPE]==GX_PLANET || body[LOC_TYPE]==GX_MOON){
            
            obj1 = instance_create(body[LOC_X1],body[LOC_Y1],obj_planet);
            obj1.data = body;
            size_mod = body[LOC_W1] / sprite_get_width(spr_planet); 
            with(obj1){               
                image_xscale = size_mod;
                image_yscale = size_mod;                
                depth = curdepth;
                global_index = body[LOC_INDEX];                  
                global_type = "";
                faction = FACTION_NEUTRAL;
                name = body[LOC_NAME];
                drawReady=true;
            }
            global.sector_economy[body[LOC_ECONOMY]] += 1;
        
        }else if( body[LOC_TYPE]==GX_STATION ){
            
            obj1 = instance_create(body[LOC_X1],body[LOC_Y1],obj_station);
            obj1.data = body;
            with(obj1){
                global_index = body[LOC_INDEX];                  
                global_type = "station";
                faction = FACTION_NEUTRAL;
                name = body[LOC_NAME];
                depth = curdepth;
                event_user(0);// apply vars
                event_user(1);
            }
            global.sector_economy[body[LOC_ECONOMY]] += 1;
            
        }
        
               
    }
                
}

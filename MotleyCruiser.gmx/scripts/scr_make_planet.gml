/// Create a planet with attributes
// scr_make_planet(sector_row, sector_column, location index)
var map = scr_location();

var x1=0;
var y1=0;
var w1=0;
var clr=noone;
var min_width = sprite_get_width(spr_planet) * 2;
var max_width = sprite_get_width(spr_planet) * 4;

var sector = noone;
sector[0]=argument0;
sector[1]=argument1;
loc_index = argument2;

w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );

map[LOC_TYPE]=GX_PLANET;
map[LOC_X1]=x1;
map[LOC_Y1]=y1;
map[LOC_W1]=w1;
map[LOC_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
map[LOC_SPRITE]=floor(random(sprite_get_number(spr_planet)));
map[LOC_SECTOR]=sector;
map[LOC_NPCS] = noone;
map[LOC_INDEX]=scr_make_loc_index(argument0,argument1,argument2);
var cmnName = scr_planet_name_generator();
map[LOC_NAME] = cmnName;
map[LOC_NAME_1] = cmnName;
map[LOC_ECONOMY]=irandom(3);
map[LOC_ECON_MOD] = random_range(.01,.05);
map[LOC_ECON_OFFSET] = irandom(global.commodity_lib_count -1);

map[LOC_TEMPERATURE] = choose("hot","cold");
map[LOC_LIFE] = irandom(4);
var terrain;
if(map[LOC_TEMPERATURE]=="hot"){
    if(map[LOC_LIFE]>1){
        terrain = choose(terrains.desert,terrains.swamp,terrains.rocky,terrains.jungle,terrains.plains,terrains.ocean); 
    }else{
        terrain = choose(terrains.desert,terrains.swamp,terrains.rocky);
    }

}else{
    if(map[LOC_LIFE]>1){
        terrain = choose(terrains.desert,terrains.rocky,terrains.glacier,terrains.forest,terrains.tundra); 
    }else{
        terrain = choose(terrains.desert,terrains.rocky,terrains.glacier);
    }
}

map[LOC_TERRAIN]=terrain;
map[LOC_CONDITION] = choose("good","bad");
map[LOC_SETTLEMENT] = true;
map[LOC_ATTITUDE] = choose("good","bad","mixed");
map[LOC_DESCRIPTION]=scr_planet_description_generator(map);
// 
map[LOC_IMAGE_DATA]=scr_planet_imagedata_generator(map);

return map;

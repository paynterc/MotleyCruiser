/// Create a dsmap with sun attributes
// scr_make_sun(sector_row, sector_column)

var sun = noone;
sun[5] = 0;// Initialize array with 5 slots.

var sector = noone;
sector[0]=argument0;
sector[1]=argument1;

var x1=0;
var y1=0;
var w1=0;
var clr=noone;
var min_width = sprite_get_width(spr_sun) / 2;
var max_width = sprite_get_width(spr_sun) * 3;


w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );


sun[SUN_X1]=x1;
sun[SUN_Y1]=y1;
sun[SUN_W1]=w1;
sun[SUN_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
sun[SUN_PLANETS]=noone;
sun[SUN_SECTOR]=sector;


return sun;

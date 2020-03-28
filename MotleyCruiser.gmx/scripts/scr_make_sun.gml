/// Create a dsmap with sun attributes
// scr_make_sun(sector_row, sector_column)

var sun = scr_location();

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


sun[LOC_X1]=x1;
sun[LOC_Y1]=y1;
sun[LOC_W1]=w1;
sun[LOC_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
sun[LOC_SECTOR]=sector;
sun[LOC_TYPE]=GX_SUN;
sun[LOC_LANDABLE]=false;
sun[LOC_HAS_PORT]=false;


return sun;

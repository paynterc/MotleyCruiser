/// scr_grant_navpath()
// Grant a random nav path. One you don't already have.

// Select a random direction, one sector away. Create a "splash" of
// nav paths radiating out from this sector.
var gx1 = global.sector_x;
var gy1 = global.sector_y;
var xdir;
var ydir;
var gx2;
var gy2;
for(var i=0;i<5;i++){
    xdir = choose(-1,1);
    ydir = choose(-1,1);
    gx2 = gx1+xdir;
    gy2 = gy1+ydir;
    scr_gx_make_path(gx1,gy1,gx2,gy2);
    gx1=gx2;
    gy1=gy2;
}


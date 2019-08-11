///scr_gridcol_line(x1,y1,x2,y2,useMPgrid);
// Returns true if there is blockage along line of site

//=== INPUT ===
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
var tx = args[2];
var ty = args[3];
var useMPgrid = args[4];
if(useMPgrid==noone){
    useMPgrid=1;// Default to mp grid
}


var col = false;
// Check Start + End Point
col=(scr_gridcol_point(sx,sy,useMPgrid)||scr_gridcol_point(tx,ty,useMPgrid)); if col return col;
var cell = CELL_WIDTH;

// Check INTEGER X coordinates that intersect with grid, determine according y values mathematically    
var deltax=abs((tx div cell) - (sx div cell));
if deltax>0{
    var xslope=((ty-sy)/(tx-sx));                                                                                                   // Determine Linear Equation Slope, solving y(x);
    var cx=(sx&~(cell-1))+(cell-1)*(tx>sx);                                                                                                     // From Start X get nearest intersection with grid;
    var cy=sy+xslope*(cx-sx)                                                                                                        // Adjust y value for nearest X Intersection;
    col = (scr_gridcol_point(cx,cy,useMPgrid)||scr_gridcol_point( (tx&~(cell-1))+(cell-1)*(tx<sx),ty+xslope*(((tx&~(cell-1))+(cell-1)*(tx<sx))-tx),useMPgrid) ); if col return col;       // Checks the very first X-Intersections with cell from start and end!                               
    var dirx=(tx>sx)-(tx<sx);                                                                                                       // If still no collision check all the cells inbetween: Determine sign of x ==> direction;
    repeat(deltax-1){                                                                                                               // repeat as often as there are as of yet unchecked cells between Start X and End X;
        col = (scr_gridcol_point(cx+dirx,cy+xslope*dirx,useMPgrid)||scr_gridcol_point(cx+cell*dirx,cy+xslope*cell*dirx,useMPgrid)); if col return col;              // Checks first and second intersect of line within cell on line - and returns true if there is one
        cx+=cell*dirx;                                                                                                                // If no collision move along X on by given grid_dimensions of cellpx;
        cy+=xslope*cell*dirx;                                                                                                         // adjust Y accordingly;
    }
}
   
// Check INTEGER Y coordinates that intersect with grid, determine according x values mathematically                                // If no collisions found along X-Axis, Repeat Y-Axis   
var deltay=abs((ty div cell) - (sy div cell));
if deltay>0{
    var yslope=((tx-sx)/(ty-sy));                                                                                                   // Determine Linear Equation Slope, solving x(y);
    var cy=(sy&~(cell-1))+(cell-1)*(ty>sy);                 
    var cx=sx+yslope*(cy-sy)                    
    col=(scr_gridcol_point(cx,cy,useMPgrid)||scr_gridcol_point(tx+yslope*(((ty&~(cell-1))+(cell-1)*(ty<sy))-ty),(ty&~(cell-1))+(cell-1)*(ty<sy),useMPgrid)); if col return col;                                 
    var diry=(ty>sy)-(ty<sy);
    repeat(deltay-1){
        col = (scr_gridcol_point(cx+yslope*diry,cy+diry,useMPgrid)||scr_gridcol_point(cx+yslope*cell*diry,cy+cell*diry,useMPgrid)); if col return col;
        cy+=cell*diry;
        cx+=yslope*cell*diry;
    }
}

return col;

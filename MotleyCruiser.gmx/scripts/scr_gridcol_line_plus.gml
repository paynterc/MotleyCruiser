///scr_gridcol_line(x1,y1,x2,y2);

//=== INPUT ===
var sx=argument0;   var sy=argument1;   var tx=argument2;   var ty=argument3;
var col = false;
var result = noone;
result[0]=tx;
result[1]=ty;
// Check Start + End Point

if(scr_gridcol_point(sx,sy)){
    result[0]=sx;
    result[1]=sy;
    return result;
}

if(scr_gridcol_point(tx,ty)){
    result[0]=tx;
    result[1]=ty;
    return result;
}


var cell = CELL_WIDTH;

// Check INTEGER X coordinates that intersect with grid, determine according y values mathematically    
var deltax=abs((tx div cell) - (sx div cell));
if deltax>0{
    var xslope=((ty-sy)/(tx-sx));                                                                                                   // Determine Linear Equation Slope, solving y(x);
    var cx=(sx&~(cell-1))+(cell-1)*(tx>sx);                                                                                                     // From Start X get nearest intersection with grid;
    var cy=sy+xslope*(cx-sx);
                                                                                                            // Adjust y value for nearest X Intersection;
    //col = (scr_gridcol_point(cx,cy)||scr_gridcol_point((tx&~(cell-1))+(cell-1)*(tx<sx), ty+xslope*(((tx&~(cell-1))+(cell-1)*(tx<sx))-tx)) ); if col return result;       // Checks the very first X-Intersections with cell from start and end!                               
    
    if(scr_gridcol_point(cx,cy)){
        result[0]=cx;
        result[1]=cy;
        return result;
    }
    
    if(scr_gridcol_point((tx&~(cell-1))+(cell-1)*(tx<sx), ty+xslope*(((tx&~(cell-1))+(cell-1)*(tx<sx))-tx)) ){
        result[0]=(tx&~(cell-1))+(cell-1)*(tx<sx);
        result[1]= ty+xslope*(((tx&~(cell-1))+(cell-1)*(tx<sx))-tx);
        return result;   
    }
    
    
    var dirx=(tx>sx)-(tx<sx);                                                                                                       // If still no collision check all the cells inbetween: Determine sign of x ==> direction;
    repeat(deltax-1){
        //col = (scr_gridcol_point(cx+dirx,cy+xslope*dirx)||scr_gridcol_point(cx+cell*dirx,cy+xslope*cell*dirx)); if col return col;
                                                                                                                                                                                                                               // repeat as often as there are as of yet unchecked cells between Start X and End X;       
        if(scr_gridcol_point(cx+dirx,cy+xslope*dirx)){
            result[0]=cx+dirx;
            result[1]=cy+xslope*dirx;
            return result;
        }
        
        if(scr_gridcol_point(cx+cell*dirx,cy+xslope*cell*dirx)){
            result[0]=cx+cell*dirx;
            result[1]=cy+xslope*cell*dirx;
            return result;
        }
       
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
    //col=(scr_gridcol_point(cx,cy)||scr_gridcol_point(tx+yslope*(((ty&~(cell-1))+(cell-1)*(ty<sy))-ty),(ty&~(cell-1))+(cell-1)*(ty<sy))); if col return result;
    
    if(scr_gridcol_point(cx,cy)){
        result[0]=cx;
        result[1]=cy;
        return result;
    }
    
    if( scr_gridcol_point(tx+yslope*(((ty&~(cell-1))+(cell-1)*(ty<sy))-ty),(ty&~(cell-1))+(cell-1)*(ty<sy)) ){
        result[0]=tx+yslope*(((ty&~(cell-1))+(cell-1)*(ty<sy))-ty);
        result[1]= (ty&~(cell-1))+(cell-1)*(ty<sy);
        return result;   
    }
    
                                     
    var diry=(ty>sy)-(ty<sy);
    repeat(deltay-1){

        //col = (scr_gridcol_point(cx+yslope*diry,cy+diry)||scr_gridcol_point(cx+yslope*cell*diry,cy+cell*diry)); if col return result;
        
        if(scr_gridcol_point(cx+yslope*diry,cy+diry)){
            result[0]=cx+yslope*diry;
            result[1]=cy+diry;
            return result;
        }
        
        if(scr_gridcol_point(cx+yslope*cell*diry,cy+cell*diry)){
            result[0]=cx+yslope*cell*diry;
            result[1]=cy+cell*diry;
            return result;
        }
               
        cy+=cell*diry;
        cx+=yslope*cell*diry;
    }
}


return result;

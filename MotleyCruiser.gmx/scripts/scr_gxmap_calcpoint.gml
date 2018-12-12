/// scr_gxmap_calcpoint(gxPt,sxPt);
var gxPt = real(argument0);
var sxPt = real(argument1);

//return ( ( GX_GRIDSIZE * gxPt ) * GX_MAGNITUDE ) + ( sxPt * GX_MAGNITUDE );
return ( GX_GRIDSIZE * gxPt  ) + sxPt ;

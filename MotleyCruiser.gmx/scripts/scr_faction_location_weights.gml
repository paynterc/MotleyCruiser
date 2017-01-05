/// scr_faction_location_weights(col,row);
// Weight probability of faction by location
// Requires global.faction_centers

var col =  real(argument0);
var row = real(argument1);
var fc = global.faction_centers;
var fweights = noone;

for(var i = 0; i<array_height_2d(fc); i++){
    var fx = fc[i,0]; // faction center x
    var fy = fc[i,1]; // faction cetner y
    var frange = fc[i,3]; // faction range
    var xdist = abs( fx - col);
    var ydist = abs( fy - row);
    fweights[i] = max(1,frange - (xdist+ydist));
}

return fweights;

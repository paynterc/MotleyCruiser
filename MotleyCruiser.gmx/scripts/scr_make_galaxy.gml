/// Create a 2d array of the galaxy
var galaxy = global.galaxy_width;

var gwidth = 20;
var row=0;
var col=0;

var suns = noone;
var stations = noone;


var suncount = 0;
var sunmax = 5;
var stationcount = 0;
var stationmax = 3;
var i=0;
var sector = noone;



for(row=0; row < gwidth; row++){
    
    for(col=0; col < gwidth; col++){
        // Reset sector
        suns=noone;
        stations=noone;
        sector = ds_map_create();
        
        /***
        suncount = irandom_range(0,sunmax);
        for(i=0; i<suncount; i++){
            suns[i]=scr_make_sun();
        }
        ***/
        
        stationcount = irandom(stationmax);
        for(i=0; i<stationcount; i++){
            stations[i]=scr_make_station();
        }
        
        
        
        sector[? "suns"]=suns;
        sector[? "stations"]=stations;
                             
        galaxy[row,col] = sector;
        
    }
}

return galaxy;

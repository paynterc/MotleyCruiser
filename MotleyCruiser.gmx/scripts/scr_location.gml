/// A generic array that can be used for planets, stations or moons
//scr_location()
var loc = noone;

loc[LOC_INDEX]=noone;

loc[LOC_X1]=noone;
loc[LOC_Y1]=noone;
loc[LOC_NAME]=noone;
loc[LOC_NPCS]=noone;
loc[LOC_SECTOR]=noone;
loc[LOC_GLOBAL_INDEX]=noone;
loc[LOC_TYPE]=noone;// planet, moon, station
loc[LOC_NAME_1]=noone;// Names usually come in more than one part. This can hold the first part
loc[LOC_ECONOMY]=noone;
loc[LOC_ECON_MOD]=noone;
loc[LOC_ECON_OFFSET]=noone;
loc[LOC_W1]=noone;
loc[LOC_COLOR]=noone;
loc[LOC_SPRITE]=noone;
loc[LOC_DESCRIPTION]="";
loc[LOC_IMAGE_DATA]=noone;
loc[LOC_TEMPERATURE]=noone;
loc[LOC_LIFE]=noone;
loc[LOC_TERRAIN]=noone;
loc[LOC_CONDITION]=noone;
loc[LOC_SETTLEMENT]=noone;
loc[LOC_ATTITUDE]=noone;
loc[LOC_ATMOSPHERE]=noone;
loc[LOC_SERVICES]=noone;
loc[LOC_ROOMS]=noone;
loc[LOC_LANDABLE]=true;
loc[LOC_DISCOVERED]=false;
loc[LOC_HAS_PORT]=true;
return loc;

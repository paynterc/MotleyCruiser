/// Base unit of dialog. Used to build library.
var map = noone;
map[0]=noone; // DIA_RESP_TXT: "Hello there, [#replace1#]" 
map[1]=noone; // DIA_RESP_TYPE: intro,farewell,tip,exposition,rebuff
map[2]=noone; // DIA_RESP_SUBTYPE: expo-homeworld, expo-personal, expo-team, expo-motivation
map[3]=noone; // DIA_RESP_DISPOSITION: 0=friendly, 1=neutral, 2=hostile
map[4]=noone; // DIA_RESP_RACE
map[5]=noone; // DIA_RESP_PART: Placement
map[6]=noone; // DIA_RESP_TAG: rude, pleasant, arrogant
return map;


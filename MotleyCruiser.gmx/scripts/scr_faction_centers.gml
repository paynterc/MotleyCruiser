/*************
Coordinates of sectors that are the center for each faction
- DEPRECATED. USING RACIAL CENTERS NOW.
**************/

var fc = noone;// Faction centers


fc[0,0]=7;// x coord
fc[0,1]=7;// y coord
fc[0,2]=FACTION_FEDERATION;// FACTION
fc[0,3]=7;// RANGE

fc[1,0]=12;// x coord
fc[1,1]=12;// y coord
fc[1,2]=FACTION_EMPIRE;// FACTION
fc[1,3]=7;// RANGE

fc[2,0]=7;// x coord
fc[2,1]=12;// y coord
fc[2,2]=FACTION_REBEL;// FACTION
fc[2,3]=7;// RANGE

fc[3,0]=12;// x coord
fc[3,1]=7;// y coord
fc[3,2]=FACTION_PIRATE;// FACTION
fc[3,3]=7;// RANGE


fc[4,0]=2;// x coord
fc[4,1]=2;// y coord
fc[4,2]=FACTION_VAYLIT;// FACTION
fc[4,3]=7;// RANGE

fc[5,0]=7;// x coord
fc[5,1]=2;// y coord
fc[5,2]=FACTION_PUDNING;// FACTION
fc[5,3]=7;// RANGE

fc[6,0]=12;// x coord
fc[6,1]=2;// y coord
fc[6,2]=FACTION_SELGESH;// FACTION
fc[6,3]=7;// RANGE

fc[7,0]=17;// x coord
fc[7,1]=2;// y coord
fc[7,2]=FACTION_GORGAN;// FACTION
fc[7,3]=7;// RANGE


fc[8,0]=2;// x coord
fc[8,1]=7;// y coord
fc[8,2]=FACTION_FLOWRIDIAN;// FACTION
fc[8,3]=7;// RANGE

fc[9,0]=17;// x coord
fc[9,1]=7;// y coord
fc[9,2]=FACTION_ARCNID;// FACTION
fc[9,3]=7;// RANGE

fc[10,0]=2;// x coord
fc[10,1]=12;// y coord
fc[10,2]=FACTION_HUMAN;// FACTION
fc[10,3]=7;// RANGE

fc[11,0]=17;// x coord
fc[11,1]=12;// y coord
fc[11,2]=FACTION_CRYPTOLID;// FACTION
fc[11,3]=7;// RANGE

fc[12,0]=2;// x coord
fc[12,1]=17;// y coord
fc[12,2]=FACTION_HURGAN;// FACTION
fc[12,3]=7;// RANGE

fc[13,0]=7;// x coord
fc[13,1]=17;// y coord
fc[13,2]=FACTION_CHICKEN;// FACTION
fc[13,3]=7;// RANGE

fc[14,0]=12;// x coord
fc[14,1]=17;// y coord
fc[14,2]=FACTION_SELWAT;// FACTION
fc[14,3]=7;// RANGE

fc[15,0]=17;// x coord
fc[15,1]=17;// y coord
fc[15,2]=FACTION_ANDRONE;// FACTION
fc[15,3]=7;// RANGE

global.faction_centers = fc;

var faction_races = noone;
faction_races[FACTION_CRYPTOLID,0]=9;// Cryptolid
faction_races[FACTION_ZOMBOID,0]=10;// Zomboid
faction_races[FACTION_ANTINOID,0]=11;// Antinoid
faction_races[FACTION_FLOWRIDIAN,0]=3;// xx
faction_races[FACTION_ANDRONE,0]=4;// xx
faction_races[FACTION_PUDNING,0]=5;// xx
faction_races[FACTION_ARCNID,0]=6;// xx
faction_races[FACTION_GORGAN,0]=7;// xx
faction_races[FACTION_HURGAN,0]=2;// xx
faction_races[FACTION_BOT,0]=8;// xx
faction_races[FACTION_CHICKEN,0]=1;// xx


faction_races[FACTION_SELWAT,0]=13;// xx
faction_races[FACTION_SELWAT,1]=15;// xx
faction_races[FACTION_SELWAT,2]=14;// xx

faction_races[FACTION_FEDERATION,0]=12;// xx
faction_races[FACTION_FEDERATION,1]=3;// xx
faction_races[FACTION_FEDERATION,2]=8;// xx
faction_races[FACTION_FEDERATION,3]=5;// xx

faction_races[FACTION_EMPIRE,0]=9;// xx
faction_races[FACTION_EMPIRE,1]=11;// xx
faction_races[FACTION_EMPIRE,2]=13;// xx
faction_races[FACTION_EMPIRE,3]=8;// xx

faction_races[FACTION_REBEL,0]=0;// xx
faction_races[FACTION_REBEL,1]=1;// xx
faction_races[FACTION_REBEL,2]=2;// xx

faction_races[FACTION_PIRATE,0]=0;// xx
faction_races[FACTION_PIRATE,1]=0;// xx
faction_races[FACTION_PIRATE,2]=0;// xx

faction_races[FACTION_VAYLIT,0]=12;// xx
faction_races[FACTION_VAYLIT,1]=16;// xx

faction_races[FACTION_SELGESH,0]=15;// xx
faction_races[FACTION_HUMAN,0]=0;// xx

global.faction_races = faction_races;

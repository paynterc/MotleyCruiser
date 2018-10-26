/***********************
Coordinates of sectors that are the center for each RACE
************************/
var fc = noone;// family centers
var rts = 5; //RACIAL TERRITORY SIZE. I.E. 5X5;

global.rTSize = rts;

// 0,0 is always human
fc[0,0]=0;// x coord
fc[0,1]=0;// y coord
fc[0,2]=scr_array(0);// Just Humans


// Add eight random races at regular intervals around the center
var rRaces = scr_new_array();
while(array_length_1d(rRaces) < 9){
    var randomRace = irandom_range(1, array_height_2d(global.races)-1 );
    if(scr_in_array(rRaces,randomRace)) continue;
    scr_push_array_1d(rRaces,randomRace);
}

/***
ONE RACE
***/
// top
fc[1,0]=0;// x coord
fc[1,1]=rts*-2;// y coord
fc[1,2]=scr_array(rRaces[0]);

// top right
fc[2,0]=rts*2;// x coord
fc[2,1]=rts*-2;// y coord
fc[2,2]=scr_array(rRaces[1]);

// right
fc[3,0]=rts*2;// x coord
fc[3,1]=0;// y coord
fc[3,2]=scr_array(rRaces[2]);

// bottom right
fc[4,0]=rts*2;// x coord
fc[4,1]=rts*2;// y coord
fc[4,2]=scr_array(rRaces[3]);// RACE

// bottom
fc[5,0]=0;// x coord
fc[5,1]=rts*2;// y coord
fc[5,2]=scr_array(rRaces[4]);// RACE

// bottom left
fc[6,0]=rts*-2;// x coord
fc[6,1]=rts*2;// y coord
fc[6,2]=scr_array(rRaces[5]);// RACE

// left
fc[7,0]=rts*-2;// x coord
fc[7,1]=0;// y coord
fc[7,2]=scr_array(rRaces[6]);// RACE

// top left
fc[8,0]=rts*-2;// x coord
fc[8,1]=rts*-2;// y coord
fc[8,2]=scr_array(rRaces[7]);// RACE

var idx;
/***
TWO RACES
***/

// top
idx = 9;
fc[idx,0]=0;// x coord
fc[idx,1]=rts*-1;// y coord
fc[idx,2]=scr_array(0,rRaces[0]);

// top right
idx = 10;
fc[idx,0]=rts;// x coord
fc[idx,1]=rts*-1;// y coord
fc[idx,2]=scr_array(0,rRaces[1]);

// right
idx = 11;
fc[idx,0]=rts;// x coord
fc[idx,1]=0;// y coord
fc[idx,2]=scr_array(0,rRaces[2]);

// bottom right
idx = 12;
fc[idx,0]=rts;// x coord
fc[idx,1]=rts;// y coord
fc[idx,2]=scr_array(0,rRaces[3]);// RACE

// bottom
idx = 13;
fc[idx,0]=0;// x coord
fc[idx,1]=rts;// y coord
fc[idx,2]=scr_array(0,rRaces[4]);// RACE

// bottom left
idx = 14;
fc[idx,0]=rts*-1;// x coord
fc[idx,1]=rts;// y coord
fc[idx,2]=scr_array(0,rRaces[5]);// RACE

// left
idx = 15;
fc[idx,0]=rts*-1;// x coord
fc[idx,1]=0;// y coord
fc[idx,2]=scr_array(0,rRaces[6]);// RACE

// top left
idx = 16;
fc[idx,0]=rts*-1;// x coord
fc[idx,1]=rts*-1;// y coord
fc[idx,2]=scr_array(0,rRaces[7]);// RACE

/***
THREE RACES
***/

// top
idx = 17;
fc[idx,0]=rts;// x coord
fc[idx,1]=rts*-2;// y coord
fc[idx,2]=scr_array(rRaces[1],rRaces[2], irandom_range(1, array_height_2d(global.races)-1 ) );

// top right
idx = 18;
fc[idx,0]=rts*2;// x coord
fc[idx,1]=rts*-1;// y coord
fc[idx,2]=scr_array(rRaces[2],rRaces[3], irandom_range(1, array_height_2d(global.races)-1 ) );

// right
idx = 19;
fc[idx,0]=rts*2;// x coord
fc[idx,1]=rts;// y coord
fc[idx,2]=scr_array(rRaces[3],rRaces[4], irandom_range(1, array_height_2d(global.races)-1 ) );

// bottom right
idx = 20;
fc[idx,0]=rts;// x coord
fc[idx,1]=rts*2;// y coord
fc[idx,2]=scr_array(rRaces[4],rRaces[5], irandom_range(1, array_height_2d(global.races)-1 ) );// RACE

// bottom
idx = 21;
fc[idx,0]=rts*-1;// x coord
fc[idx,1]=rts*2;// y coord
fc[idx,2]=scr_array(rRaces[5],rRaces[6], irandom_range(1, array_height_2d(global.races)-1 ) );// RACE

// bottom left
idx = 22;
fc[idx,0]=rts*-2;// x coord
fc[idx,1]=rts;// y coord
fc[idx,2]=scr_array(rRaces[6],rRaces[7], irandom_range(1, array_height_2d(global.races)-1 ) );// RACE

// left
idx = 23;
fc[idx,0]=rts*-2;// x coord
fc[idx,1]=rts*-1;// y coord
fc[idx,2]=scr_array(rRaces[7],rRaces[8], irandom_range(1, array_height_2d(global.races)-1 ) );// RACE

// top left
idx = 24;
fc[idx,0]=rts*-1;// x coord
fc[idx,1]=rts*-2;// y coord
fc[idx,2]=scr_array(rRaces[8],rRaces[1], irandom_range(1, array_height_2d(global.races)-1 ) );// RACE

global.racial_centers = fc;


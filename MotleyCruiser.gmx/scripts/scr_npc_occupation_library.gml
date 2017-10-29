//scr_npc_occupation_library()
// The keys in this array are important.
// NPCs receive the numerical key, not the text value of the trait
var t = noone;

// trader,shipwright,fighter,pilot,medic,mechanic

t[0]="fighter";
t[1]="pilot";
t[2]="medic";
t[3]="mechanic";
t[4]="cook";
t[5]="trader";
t[6]="scholar";
t[7]="miner";
t[8]="musician";
t[9]="scientist";
t[10]="tipster";
t[11]="scholar";
t[12]="bounty hunter";
t[11]="musician";


global.npc_occupations=t;

var hirable = noone;
hireable[0]="fighter";
hireable[1]="pilot";
hireable[2]="medic";
hireable[3]="mechanic";
hireable[4]="cook";

global.hirable_occupations = hireable;

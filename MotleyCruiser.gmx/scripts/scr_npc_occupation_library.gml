//scr_npc_occupation_library()
// The keys in this array are important.
// NPCs receive the numerical key, not the text value of the trait
var t = noone;

// trader,shipwright,fighter,pilot,medic,mechanic
enum occupation{
    fighter,
    pilot,
    medic,
    mechanic,
    cook,
    trader,
    scholar,
    miner,
    musician,
    scientist,
    tipster,
    smuggler,
    bountyHunter,
    blackMarketeer,
    bartender,
    merchant,
    shipwright,
    LENGTH 
}


t[occupation.fighter]="fighter";
t[occupation.pilot]="pilot";
t[occupation.medic]="medic";
t[occupation.mechanic]="mechanic";
t[occupation.cook]="cook";
t[occupation.trader]="trader";
t[occupation.scholar]="scholar";
t[occupation.miner]="miner";
t[occupation.musician]="musician";
t[occupation.scientist]="scientist";
t[occupation.tipster]="tipster";
t[occupation.smuggler]="smuggler";
t[occupation.bountyHunter]="bounty hunter";
t[occupation.blackMarketeer]="black marketeer";
t[occupation.bartender]="bartender";
t[occupation.merchant]="merchant";
t[occupation.shipwright]="shipwright";

global.npc_occupations=t;
/***
var hirable = noone;
hireable[0]="fighter";
hireable[1]="pilot";
hireable[2]="medic";
hireable[3]="mechanic";
hireable[4]="cook";
***/
hireable = scr_array(occupation.fighter,occupation.pilot,occupation.medic,occupation.mechanic,occupation.cook);

global.hirable_occupations = hireable;

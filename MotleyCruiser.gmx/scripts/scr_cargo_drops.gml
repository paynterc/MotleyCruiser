/***
A list of items that could drop from crates onboard ships.
Includes cargo items like water, fuel, food etc.

credits
guns
grenades
crate keys
door keys
drone spawner
medkit
drugs
maps

***/
//scr_npc_drops()
var c=noone;
c=scr_push_array(c,0);//oxygen
c=scr_push_array(c,6);//water
c=scr_push_array(c,45);//industrial equipment
c=scr_push_array(c,50);//souldust
c=scr_push_array(c,51);//blaster rifle
c=scr_push_array(c,52);//cratemaster
c=scr_push_array(c,53);//sticky grenade
c=scr_push_array(c,2);//flash
c=scr_push_array(c,59);//Star Map

return c;

/// scr_mission_make_random(npcData)
var npc_data = argument0;

var mission = noone;
var odds = 6;
if(irandom(odds)==odds){
    scr_gx_people_add(npc_data);// npc_data[NPC_GLOBAL_INDEX] should now be set. You will need this to create missions.
    var roll = irandom(2);
    if(roll==0){
        mission = scr_mission_type_killxy(npc_data,2,false);
    }else if(roll==1){
        var cargo = irandom(6);
        var qty = irandom_range(5,15);
        mission = scr_mission_type_deliver_cargo(npc_data,cargo,qty,false);
    }else if(roll==2){
        mission = scr_mission_type_deliver_passenger(npc_data);
    }
}

if(is_undefined(mission)){
    mission = noone;
}

return mission;

//scr_change_hire_price(amount)
var amount = real(argument0);
if(closest_sentient!=noone){
    closest_sentient.hire_price = amount;
    var npc_record = global.npcs[closest_sentient.global_index];
    npc_record[@ NPC_HIRE_PRICE]=amount;
}


/// Drop some loot
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var item_id;
var item_max;
var drop_odds = args[0];
var item_odds = args[1];
var item_table = args[2];

if(drop_odds==noone){
    drop_odds = 2;
}
if(item_odds==noone){
    item_odds = 2;
}


if(irandom(drop_odds)==drop_odds){
    loot = instance_create(x,y,obj_da_loot);
    loot.depth = -1000;
    if(irandom(item_odds)==item_odds){
        
        if(item_table==noone){
            item_id = irandom(53);
            loot.inv_id = item_id;
            item_max = item_id_read(item_id,1);
            loot.inv_amount = max(1,irandom(item_max));  
        }else if(item_table == 'npc'){
            var npc_drop_table = scr_npc_drops();
            item_id = scr_array_random(npc_drop_table);
            loot.inv_id = item_id;
            loot.inv_amount = 1;
        }    
      
    }else{
        var credit_amount = irandom_range(100,500);
        loot.credits = credit_amount;    
    }

}


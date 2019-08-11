/// Drop some loot
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var loot;
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

    if( item_odds>0 && irandom(item_odds)==item_odds ){
        
        loot = instance_create(irandom_range(x,x),irandom_range(y,y),obj_da_loot);
        loot.depth = -1000;
        if(item_table == 'npc'){
            var npc_drop_table = scr_npc_drops();
            item_id = scr_array_random(npc_drop_table);
            loot.inv_id = item_id;
            loot.inv_amount = 1;
        }else if(item_table == 'cargocrate'){
            // This is a drop from a ship level cargo crate. This will use the commodity table
            var commodity_id = irandom(global.commodity_lib_count);
            loot.commodity_id = commodity_id;
            loot.inv_amount = irandom(2)+1;
        }else{
            item_id = irandom(53);
            loot.inv_id = item_id;
            item_max = item_id_read(item_id,1);
            loot.inv_amount = max(1,irandom(item_max)); 
        }
              
    }else{
        var credit_amount = irandom_range(1,5);
        for(var cc=0;cc<credit_amount;cc++){
            loot = instance_create(irandom_range(x-8,x+8),irandom_range(y-12,y+12),obj_da_loot);
            loot.depth = -1000;
            loot.credits = 5;
        }         
    }
    
    /***
    item_id = 59;
    loot.inv_id = item_id;
    loot.inv_amount = 1;
    loot.credits = 0;
    ***/
}


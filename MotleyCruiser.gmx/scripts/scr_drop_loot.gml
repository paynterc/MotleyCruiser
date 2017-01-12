/// Drop some loot
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}


var drop_odds = args[0];
var item_odds = args[1];

if(drop_odds==noone){
    drop_odds = 2;
}
if(item_odds==noone){
    item_odds = 5;
}


if(irandom(drop_odds)==drop_odds){
    loot = instance_create(x,y,obj_da_loot);
    loot.depth = -1000;
    if(irandom(item_odds)==item_odds){       
        loot.inv_id = irandom(53);
        loot.inv_amount = 1;        
    }else{
        var credit_amount = irandom_range(100,500);
        loot.credits = credit_amount;    
    }

}


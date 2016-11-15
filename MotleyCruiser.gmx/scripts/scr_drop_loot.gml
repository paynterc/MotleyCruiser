/// Drop some loot
var drop_odds = 2;
var item_odds = 5;
if(irandom(drop_odds)==drop_odds){
    loot = instance_create(x,y,obj_da_loot);
    loot.depth = -1000;
    if(irandom(item_odds)==item_odds){       
        loot.inv_id = 52;
        loot.inv_amount = 1;        
    }else{
        var credit_amount = irandom_range(10,100);
        loot.credits = credit_amount;    
    }

}


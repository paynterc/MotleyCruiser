/**********
Sell item.
**********/
// scr_trade_sell(item_id,price,amount);
var item_id = argument0;
var price = argument1;
var amount = argument2;
var ttl_price = price*amount;
var instock = scr_cargo_item_count(item_id);



if(instock>=amount){

    for(var i=0;i<amount;i++){
        scr_cargo_item_decrement(item_id,1);
        global.credits += price;
    }
    
}else{

    scr_display_message("You do not have enough of that item in your cargo.",noone);
}


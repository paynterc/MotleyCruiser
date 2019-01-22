/**********
Buy item from vendor. Add to inventory.
**********/
// scr_trade_buy(item_id,price,amount);
var item_id = argument0;
var price = argument1;
var amount = argument2;
var ttl_price = price*amount;

if(ttl_price<=global.credits){
    var result = scr_cargo_add(item_id,amount);// result will be the amount that would not fit in cargo. probably zero.
    global.credits -= (amount-result) * ttl_price;
    if(result!=0){
        scr_display_message("You don't have enough cargo space.",noone);
    }
    //show_message("result " + string(result));
}else{
    //show_message("You do not have enough credits.");
    scr_display_message("You do not have enough credits.",noone);
}


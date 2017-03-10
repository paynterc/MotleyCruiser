/**********
Sell all of the submitted item that is in inventory.
**********/
// scr_trade_sell_all(item_id,price);
var item_id = argument0;
var price = argument1;
var instock = scr_inv_item_count(item_id);

if(instock>0){

    for(var i=0;i<instock;i++){
        scr_inv_item_decrement(item_id);
        global.credits += price;
    }
    
    
}else{

    scr_display_message("You do not have that item in your cargo.","");
}


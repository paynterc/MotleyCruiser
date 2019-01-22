/**********
Buy item from vendor. Add to inventory.
**********/
// scr_trade_buy(item_id,price);
var item_id = argument0;
var price = argument1;


if(price<=global.credits){

    

    var result = scr_cargo_add(item_id,1);// result will be the amount that would not fit in cargo. probably zero.
    if(result!=0){
        scr_display_message("You don't have any free cargo space.",noone);
        return false;
    }else{
        global.credits-=price;
    }
    
    while(global.credits>=price){
        result = scr_cargo_add(item_id,1)
        if(result!=0){
            break;           
        }else{
            global.credits -=price;
            //break;
        }
    }

}else{
    //show_message("You do not have enough credits.");
    scr_display_message("You do not have enough credits.",noone);
}


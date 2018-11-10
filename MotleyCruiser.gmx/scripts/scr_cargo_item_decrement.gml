/// scr_cargo_item_decrement(key,amount)
var key = string(argument0);
var amt = argument1;
if !ds_map_exists(global.cargo_list,key){
    return amt;
}

var remainder = 0;// Amount that can not be subtracted due to lack of inventory
var holdValue = global.cargo_list[? key]
var amtFinal=0;
if(amt>holdValue){
    amtFinal = holdValue;
}else{
    amtFinal = amt;
}

if(amtFinal>0){


    var newValue = holdValue-amtFinal;
    ds_map_replace(global.cargo_list, key, newValue);

}

global.cargo_total -= amtFinal;
remainder = amt - amtFinal;
return remainder;


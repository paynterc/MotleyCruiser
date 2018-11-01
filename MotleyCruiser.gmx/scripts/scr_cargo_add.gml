/// scr_cargo_add(Cargo Name, Cargo Qty)
var key = string(argument0);
var amt = argument1;
if(!instance_exists(obj_ship_data)){
    return false;
}

var remainder = 0;// Amount that can not be added due to space limits
var availSpace = obj_ship_data.cargo - global.cargo_total;
var amtFinal=0;
if(amt>availSpace){
    amtFinal = availSpace;
}else{
    amtFinal = amt;
}

if(amtFinal>0){

    if !ds_map_exists(global.cargo_list,key){
        ds_map_add(global.cargo_list,key,amtFinal);
    }else{
        var holdValue = global.cargo_list[? key];
        var newValue = holdValue+amtFinal;
        ds_map_replace(global.cargo_list, key, newValue);
    }
    
    with(obj_ship_data){
        event_user(0);//Update cargo display
    }
}

global.cargo_total += amtFinal;
remainder = amt - amtFinal;
return remainder;


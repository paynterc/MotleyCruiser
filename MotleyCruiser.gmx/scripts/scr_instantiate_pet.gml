/// scr_instantiate_pet(x,y,data)
var xx = argument0;
var yy = argument1;
var data = argument2;
if(!is_array(data)){
    return false;
}
var obj = asset_get_index(data[0]);
if !obj return false;
var thePet = instance_create(xx,yy,obj);
thePet.data = data;
return thePet;

/// scr_cargo_drop(x,y,cargo,qty,noKill)
var args = noone;
for (var i=0; i<6; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var _x = args[0];
var _y = args[1];
var _cargo = args[2];
var _qty = args[3];
var noKill = args[4];

if(_x==noone || _y==noone){
    return false;
}

if(_cargo==noone){
    _cargo = irandom(7);//any basic commodity
}

if(_qty<1){
    _qty = irandom(2)+1;
}

if(noKill==noone){
    noKill=false;
}

var drop = instance_create(_x,_y,obj_cargo_drop);
drop.cargo = _cargo;
drop.qty = _qty;
drop.killme = !noKill;
return drop;



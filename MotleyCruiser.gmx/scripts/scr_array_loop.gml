var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var faction = args[0];
var ship_index = args[1];
var x1 = args[2];
var y1 = args[3];

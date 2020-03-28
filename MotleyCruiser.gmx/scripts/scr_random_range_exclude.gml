/// scr_random_range_exclude(lower,upper,exclude)

// declare variables
var lower = argument0;
var upper = argument1;
var exclude = argument2;

var values = noone;
var index = 0;

for(var i = lower; i<=upper; i++)
{
    if i==exclude continue;
    values[index]=i;
    index++;
}

return scr_array_random(values);

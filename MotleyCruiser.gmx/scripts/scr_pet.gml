/// Defaults for Pet
//scr_pet(object,name,owner)
var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var map = noone;

map[pet.type]=args[0];// refereces object
map[pet.name]=args[1];
map[pet.owner]=args[2];// The index from crew

return map;

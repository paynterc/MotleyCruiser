/// Used to build library 
// scr_define_sentence(text, type, subtype, disposition, race)
var args = noone;
var sentence = scr_sentence();
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        sentence[i] = argument[i];
    else
        sentence[i] = noone;
}

return sentence;


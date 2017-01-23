//scr_random_sentence(type);
var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}
var type = args[0];// Should be int
var sentence_data = scr_array_random(global.dialogue_sentences[type]);
return sentence_data[0]; // Return text portion of data

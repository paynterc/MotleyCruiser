/// scr_random_sentence(type index);
var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}
var type = real(args[0]);// Should be int
if(type<0 || type>=array_length_1d(global.dialogue_sentences)){
    return noone;
}
var sentence_data = scr_array_random(global.dialogue_sentences[type]);
if(sentence_data!=noone){
    return sentence_data[0]; // Return text portion of data
}else{
    return noone;
}


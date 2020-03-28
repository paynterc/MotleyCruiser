/// scr_crew_findby(attribute,value)
var args = noone;
for (var i=0; i<6; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var attribute = args[0];
var value = args[1];
var returnFirst = args[2];
if(returnFirst==noone) returnFirst = true;

var result=noone;
var thisCrew;
for(var i=0;i<array_length_1d(global.crew);i++){
    thisCrew = global.crew[i];
    if(scr_get_array_1d(thisCrew,attribute)==value){
        if(returnFirst){
            result = thisCrew;
            break;
        }else{
            result = scr_push_array(result,thisCrew);
        }
    }
}

return result;

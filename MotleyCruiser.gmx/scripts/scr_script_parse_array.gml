/// Parses a string containing script name plus arguments. Accepts up to 5.
// scr_script_parse_array(script,argsArray)
if(argument0==noone || argument0==""){
    return false;
}


var script = argument0;
var split = argument1;// arguments
var acount = array_length_1d(split);

switch(acount){
    case 0:
        script_execute(script);
        break;
    case 1:
        script_execute(script,split[0]);
        break;
    case 2:
        script_execute(script,split[0],split[1]);
        break;
    case 3:
        script_execute(script,split[0],split[1],split[2]);
        break;
    case 4:
        script_execute(script,split[0],split[1],split[2],split[3]);
        break;
    case 5:
        script_execute(script,split[0],split[1],split[2],split[3],split[4]);
        break;
    case 6:
        script_execute(script,split[0],split[1],split[2],split[3],split[4],split[5]);
        break;
    case 7:
        script_execute(script,split[0],split[1],split[2],split[3],split[4],split[5],split[6]);
        break;
    case 8:
        script_execute(script,split[0],split[1],split[2],split[3],split[4],split[5],split[6],split[7]);
        break;
        
}


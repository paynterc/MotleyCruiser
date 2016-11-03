/// Grant credits or inventory
//scr_grant_reward(reward_string)
var reward_string = argument0;
if(reward_string==noone) exit;
var rward = scr_str_split(reward_string,",");
var rtype = rward[0];
var rqty = rward[1];

switch(rtype)
{
    case "cr":
        global.credits += real(rqty);
        break;
    case "ship":
        // yadda
        break;
    default:
        //Default assumes item id
        inventory_item_add(real(rtype),real(rqty));

}


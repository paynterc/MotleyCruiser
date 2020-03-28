/// Grant credits or inventory
//scr_grant_reward(reward_string)
var rward = argument0;
if(!is_array(rward)) exit;

switch(rward[0])
{
    case "G":
        global.credits += real(rward[1]);
        if(debug_mode){ show_debug_message("DEBUG: Greanted " + string(real(rward[1])) + " credits.") };
        break;
    case "I":
        inventory_item_add(real(rward[1]),real(rward[2]));
        break;
    case "ship":
        // yadda
        break;
    default:
        //Default assumes item id
        if(debug_mode){ show_debug_message("DEBUG: Invalid reward type.") };

}


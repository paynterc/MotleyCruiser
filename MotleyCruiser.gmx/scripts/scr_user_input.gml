/// Abstracting user input
// scr_user_input(input_name)
// "fire", "moveleft", "moveup", "interact"

switch(argument0){
    case "fire":
        return keyboard_check(vk_space);
        break;
    case "thrust":
        return keyboard_check(vk_up);
        break;
    case "turn_left":
        return keyboard_check(vk_left);
        break;
    case "turn_right":
        return keyboard_check(vk_right);
        break;
    case "thrust_reverse":
        return keyboard_check(vk_down);
        break;
    case "dock":
        return keyboard_check_pressed(ord("D"));
        break;
    case "interact":
        return keyboard_check_pressed(ord("E"));
        break;
    case "board_ship":
        return instance_exists(obj_space_level) && keyboard_check_pressed(ord("B"));
        break;
    case "bugout":
        return instance_exists(obj_room_level) && keyboard_check_pressed(ord("M"));
        break;
    case "spawn_player_ship":
        return  
        keyboard_check_pressed(ord("S")) 
        && keyboard_check(vk_shift)
        && instance_exists(obj_space_level)
        && !instance_exists(obj_player_ship)
        && debug_mode;
        break;
    case "pause":
        return keyboard_check_pressed(vk_escape);
    case "inventory":
        return keyboard_check_pressed(ord("I"));
    case "mission_log":
        return keyboard_check_pressed(ord("L"));
    default:
        return false;
}

/// Abstracting user input
// scr_user_input(input_name)
// "fire", "moveleft", "moveup", "interact"
// Gamepad setup (thresholds, etc.) is done in obj_game_control

switch(argument0){
    case "fire":
        return keyboard_check(vk_space) || mouse_check_button(mb_left) || gamepad_button_value(global.pad, gp_shoulderrb);
        break;
    case "fire_alt":
        return keyboard_check(vk_shift) || mouse_check_button_released(mb_right) || gamepad_button_check_released(global.pad, gp_shoulderr);
        break;
    case "thrust":
        return keyboard_check(vk_up) || gamepad_axis_value(global.pad, gp_axislv) < 0;
        break;
    case "turn_left":
        return keyboard_check(vk_left) || gamepad_axis_value(global.pad, gp_axislh)< 0;
        break;
    case "turn_right":
        return keyboard_check(vk_right)|| gamepad_axis_value(global.pad, gp_axislh)> 0;
        break;
    case "thrust_reverse":
        return keyboard_check(vk_down) || gamepad_axis_value(global.pad, gp_axislv) > 0;
        break;
    case "inventory-drop":
        return keyboard_check_pressed(ord("D"))
        && keyboard_check(vk_shift)
        && global.show_inventory;
        break;
    case "dock":
        return keyboard_check_pressed(ord("D"))
        && instance_exists(obj_space_level);
        break;
    case "depart":
        return keyboard_check_pressed(ord("D"))
        && instance_exists(obj_room_level);
        break;
    case "inventory-use":
        return keyboard_check_pressed(ord("E")) 
        && global.show_inventory;
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
    case "goto_ship_edit":
        return  
        keyboard_check_pressed(ord("E")) 
        && keyboard_check(vk_shift)
        && debug_mode;
        break;
    case "goto_space":
        return  
        keyboard_check_pressed(ord("W")) 
        && keyboard_check(vk_shift)
        && debug_mode;
        break;       
    case "pause":
        return keyboard_check_pressed(vk_escape);
    case "inventory":
        return keyboard_check_pressed(ord("I"));
        break;

    case "mission_log":
        return keyboard_check_pressed(ord("L"));
        break;
    case "fullscreen":
        return keyboard_check_pressed(ord("F"))
        && keyboard_check(vk_shift);
        break;
    case "invul_mode":
        return  
        keyboard_check_pressed(ord("I"))
        && keyboard_check(vk_shift)
        && debug_mode;
        break;
    case "point_dir":
        var pdir = noone;
        if( gamepad_is_connected(global.pad) ){
            var h_point = gamepad_axis_value(global.pad, gp_axisrh);
            var v_point = gamepad_axis_value(global.pad, gp_axisrv);
            if ((h_point != 0) || (v_point != 0))
            {
                pdir = point_direction(0, 0, h_point, v_point);
            }
        }else{
            pdir = point_direction(x,y,mouse_x,mouse_y);
        }
        return pdir;
        break;     
    default:
        return false;
}

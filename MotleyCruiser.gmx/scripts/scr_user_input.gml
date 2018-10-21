/// Abstracting user input
// scr_user_input(input_name)
// "fire", "moveleft", "moveup", "interact"
// Gamepad setup (thresholds, etc.) is done in obj_game_control
var test = 1;

if(room==rm_ship_edit){
    test = 2;
    switch(argument0){
        case "flip-right":
            return keyboard_check_pressed(vk_right)
            break;           
        case "flip-left":
            return keyboard_check_pressed(vk_left);
            break;            
        case "flip-up":
            return keyboard_check_pressed(vk_up);
            break;
        case "flip-down":
            return keyboard_check_pressed(vk_down);  
            break;          
    }

    return false;
}

//Any context





switch(argument0){
    case "inventory":
        return keyboard_check_pressed(ord("I"));
        break;
    case "mission_log":
        return keyboard_check_pressed(ord("L"));
        break;
    case "toggle_minimap":
        return keyboard_check_pressed(ord("M"))
        break; 
}
        
        

if( scr_gui_has_context() ){

    switch(argument0){
        case "inventory-drop":
            return keyboard_check_pressed(ord("D"))
            && keyboard_check(vk_shift);
            break;           
        case "inventory-use":
            return (keyboard_check_pressed(ord("E")) || gamepad_button_check_released(global.pad, gp_face1));
            break;            
        case "inventory_select_next":
            return gamepad_button_check_released(global.pad,gp_padr);
            break;
        case "inventory_select_prev":
            return gamepad_button_check_released(global.pad,gp_padl);
            break; 
        case "inventory_select_down":
            return gamepad_button_check_released(global.pad,gp_padd);
            break;       
        case "inventory_select_up":
            return gamepad_button_check_released(global.pad,gp_padu);
            break;
        case "menu_op_up":
            return gamepad_button_check_released(global.pad,gp_padu);
            break;  
        case "menu_op_down":
            return gamepad_button_check_released(global.pad,gp_padd);
            break; 
            
        case "menu_op_left":
            return gamepad_button_check_released(global.pad,gp_padl);
            break;  
        case "menu_op_right":
            return gamepad_button_check_released(global.pad,gp_padr);
            break;
                           
        case "menu_op_select":
            return gamepad_button_check_pressed(global.pad, gp_face1) ||  keyboard_check_pressed(vk_enter)
            break;
        case "menu_close":
            return gamepad_button_check_pressed(global.pad, gp_face2) || keyboard_check_pressed(vk_escape)
            break;          
        case "inventory_page_left":
            if( gamepad_is_connected(global.pad) ){
                return gamepad_button_check_released(global.pad,gp_shoulderl);
            }
            break;            
        case "inventory_page_right":
            if( gamepad_is_connected(global.pad) ){
                return gamepad_button_check_released(global.pad,gp_shoulderr);
            }
            break;
        default:
            return false;   
    }

}else{
    switch(argument0){
        case "fire":
            return keyboard_check(vk_space) || mouse_check_button(mb_left) || gamepad_button_value(global.pad, gp_shoulderrb);
            break;
        case "fire_alt":
            return mouse_check_button_released(mb_right) || gamepad_button_check_released(global.pad, gp_shoulderr);
            break;
        case "thrust":
            return keyboard_check(ord("W")) || gamepad_axis_value(global.pad, gp_axislv) < 0;
            break;
        case "turn_left":
            return keyboard_check(ord("A")) || gamepad_axis_value(global.pad, gp_axislh)< 0;
            break;
        case "turn_right":
            return keyboard_check(ord("D"))|| gamepad_axis_value(global.pad, gp_axislh)> 0;
            break;
        case "thrust_reverse":
            return keyboard_check(ord("S")) || gamepad_axis_value(global.pad, gp_axislv) > 0;
            break;                          
        case "dock":
            return keyboard_check_pressed(ord("D"))
            && instance_exists(obj_space_level);
            break;
        case "depart":
            return keyboard_check_pressed(ord("D"))
            && instance_exists(obj_room_level);
            break;
        case "hotslot1":
            return (keyboard_check_pressed(ord("1")) || gamepad_button_check_pressed(global.pad, gp_face3));
            break;
        case "hotslot2":
            return (keyboard_check_pressed(ord("2")) || gamepad_button_check_pressed(global.pad, gp_face4));
            break;
        case "hotslot3":
            return (keyboard_check_pressed(ord("3")) || gamepad_button_check_pressed(global.pad, gp_face2));
            break;   
        case "interact":
            return ( keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(global.pad, gp_face1) );
            break;
        case "interact_hold":
            return ( keyboard_check(ord("E")) || gamepad_button_check(global.pad, gp_face1) );
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
        case "goto_player_edit":
            return  
            keyboard_check_pressed(ord("P")) 
            && keyboard_check(vk_shift)
            && debug_mode;
            break;
        case "goto_space":
            return  
            keyboard_check_pressed(ord("W")) 
            && keyboard_check(vk_shift)
            && debug_mode;
            break;
        case "open_trade_window":
            return  
            keyboard_check_released(ord("T")) 
            && keyboard_check(vk_shift)
            && debug_mode;
            break;               
        case "pause":
            return keyboard_check_pressed(vk_escape);
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
        case "inventory_room":
            return  
            keyboard_check_pressed(ord("N"))
            && keyboard_check(vk_shift)

            break;         
        case "auto_capture":
            return  
            keyboard_check_pressed(ord("C"))
            && keyboard_check(vk_shift)
            && debug_mode;
            break;
        case "grant_credits":
            return  
            keyboard_check_pressed(ord("C"))
            && keyboard_check(vk_shift)
            && keyboard_check(vk_control)
            && debug_mode;
            break;
        case "goto_shiplevel":
            return  
            keyboard_check_pressed(ord("R"))
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

}

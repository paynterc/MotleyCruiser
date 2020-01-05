/*** 
Abstracting user input

the pin enum is found in scr_load_player_config

if(!keyboard_check_pressed(vk_anykey)){
    return false;
}
"fire", "moveleft", "moveup", "interact"
Gamepad setup (thresholds, etc.) is done in obj_game_control
***/
/// scr_user_input(input_name)


if(room==rm_ship_edit){

    switch(argument0){
        case pin.flip_right:
            return keyboard_check_pressed(vk_right)
            break;           
        case pin.flip_left:
            return keyboard_check_pressed(vk_left);
            break;            
        case pin.flip_up:
            return keyboard_check_pressed(vk_up);
            break;
        case pin.flip_down:
            return keyboard_check_pressed(vk_down);  
            break;          
    }

    return false;
}

//Any context

switch(argument0){

    case pin.inventory:
        return keyboard_check_pressed(ord("I"));
        break;
    case pin.mission_log:
        return keyboard_check_pressed(ord("L"));
        break;
    case pin.toggle_minimap:
        return keyboard_check_pressed(ord("M"))
        break; 
}
        
        

if( scr_gui_has_context() ){

    switch(argument0){

        case pin.menu_op_up:
            return gamepad_button_check_released(global.pad,gp_padu);
            break;  
        case pin.menu_op_down:
            return gamepad_button_check_released(global.pad,gp_padd);
            break;           
        case pin.menu_op_left:
            return gamepad_button_check_released(global.pad,gp_padl);
            break;  
        case pin.menu_op_right:
            return gamepad_button_check_released(global.pad,gp_padr);
            break;
                           
        case pin.menu_op_select:
            return gamepad_button_check_pressed(global.pad, gp_face1) ||  keyboard_check_pressed(vk_enter)
            break;
        case pin.menu_close:
            return gamepad_button_check_pressed(global.pad, gp_face2) || keyboard_check_pressed(vk_escape)
            break;          
        case pin.inventory_page_left:
            if( gamepad_is_connected(global.pad) ){
                return gamepad_button_check_released(global.pad,gp_shoulderl);
            }
            break;            
        case pin.inventory_page_right:
            if( gamepad_is_connected(global.pad) ){
                return gamepad_button_check_released(global.pad,gp_shoulderr);
            }
            break;
        default:
            return false;   
    }

}else{
    switch(argument0){
        case pin.fire:
            return mouse_check_button(mb_left) || gamepad_button_value(global.pad, gp_shoulderrb);
            break;
        case pin.fire_alt:
            return mouse_check_button_released(mb_right) || gamepad_button_check_released(global.pad, gp_shoulderr);
            break;
        case pin.thrust:
            return keyboard_check(ord("W")) || gamepad_axis_value(global.pad, gp_axislv) < 0;
            break;
        case pin.turn_left:
            return keyboard_check(ord("A")) || gamepad_axis_value(global.pad, gp_axislh)< 0;
            break;
        case pin.turn_right:
            return keyboard_check(ord("D"))|| gamepad_axis_value(global.pad, gp_axislh)> 0;
            break;
        case pin.thrust_reverse:
            return keyboard_check(ord("S")) || gamepad_axis_value(global.pad, gp_axislv) > 0;
            break;                          
        case pin.dock:
            return keyboard_check_pressed(ord("D"))
            && instance_exists(obj_space_level);
            break;
        case pin.hotslot1:
            return (keyboard_check_pressed(ord("1")) || gamepad_button_check_pressed(global.pad, gp_face3));
            break;
        case pin.hotslot2:
            return (keyboard_check_pressed(ord("2")) || gamepad_button_check_pressed(global.pad, gp_face4));
            break;
        case pin.hotslot3:
            return (keyboard_check_pressed(ord("3")) || gamepad_button_check_pressed(global.pad, gp_face2));
            break;   
        case pin.interact:
            return ( keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(global.pad, gp_face1) );
            break;
        case pin.interact_hold:
            return ( keyboard_check(ord("E")) || gamepad_button_check(global.pad, gp_face1) );
            break;
        case pin.boost_ship:
            return instance_exists(obj_space_level) && keyboard_check_pressed(vk_space);
            break;
        case pin.bugout:
            return instance_exists(obj_room_level) && keyboard_check_pressed(ord("B"));
            break;
        case pin.goto_ship_edit:
            return  
            keyboard_check_pressed(ord("E")) 
            && keyboard_check(vk_shift)
            && debug_mode;
            break;
        case pin.goto_player_edit:
            return  
            keyboard_check_pressed(ord("P")) 
            && keyboard_check(vk_shift)
            && debug_mode;
            break;               
        case pin.pause:
            return keyboard_check_pressed(vk_escape);
            break;
        case pin.fullscreen:
            return keyboard_check_pressed(ord("F"))
            && keyboard_check(vk_shift);
            break;
        case pin.inventory_room:
            return  
            keyboard_check_pressed(ord("N"))
            && keyboard_check(vk_shift)
            break;
        case pin.test_room:
            return  
            keyboard_check_pressed(ord("T"))
            && keyboard_check(vk_shift)
            && keyboard_check(vk_control)
            && debug_mode;
            break;
        case pin.draw_weapon:
            return  
            keyboard_check_pressed(ord("Q"))
            break;
        case pin.zoom_out:
            return  
            keyboard_check_pressed(vk_subtract)
            break;
        case pin.zoom_in:
            return  
            keyboard_check_pressed(vk_add)
            break;
        case pin.goto_galaxy_map:
            return  
            keyboard_check_pressed(ord("N"))
        case pin.sector_jump:
            return keyboard_check_pressed(ord("J"))
            break;
        case pin.reload:
            return keyboard_check_pressed(ord("R"))
            break;
        case pin.add_grievance:
            return  
            keyboard_check_pressed(ord("G")) 
            && keyboard_check(vk_shift)
            && debug_mode;
            break;             
        default:
            return false;
    }

}

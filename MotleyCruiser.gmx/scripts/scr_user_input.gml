/// Abstracting user input
// scr_user_input(input_name)
// "fire", "moveleft", "moveup", "interact"

switch(argument0){
    case "interact":
        return keyboard_check_released(ord("E"));
        break;
    default:
        return false;
}

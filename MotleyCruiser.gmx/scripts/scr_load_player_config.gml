/**************** PLACEHOLDER
Put some global values for keyboard controls here

***********/
// keyboard control index
enum kci
{
   up = 0,
   down = 1,
   right = 2,
   left = 3,
   fire = 4,
   interact = 5
}
global.k_controls = noone;
global.k_controls[kci.up]="W";
global.k_controls[kci.down]="S";
global.k_controls[kci.right]="S";
global.k_controls[kci.right]="A";
global.k_controls[kci.fire]="leftbutton";
global.k_controls[kci.interact]="E";

// Player Inputs
enum pin
{
    fire,
    fire_alt,
    thrust,
    turn_left,
    turn_right,
    thrust_reverse,
    dock,
    hotslot1,
    hotslot2,
    hotslot3,
    interact,
    interact_hold,
    board_ship,
    bugout,
    goto_player_edit,
    pause,
    fullscreen,
    inventory_room,
    test_room,
    draw_weapon,
    zoom_in,
    zoom_out,
    point_dir,
    goto_ship_edit,
    boost_ship,
    toggle_minimap,
    menu_op_down,
    menu_op_up,
    menu_op_right,
    menu_op_left,
    menu_op_select,
    mission_log,
    menu_close,
    inventory,
    inventory_page_left,
    inventory_page_right,
    inventory_use,
    inventory_select_prev,
    inventory_select_next,
    inventory_select_down,
    inventory_select_up,
    flip_right,
    flip_left,
    flip_up,
    flip_down,
    goto_galaxy_map,
    sector_jump,
    reload,
    add_grievance
}

/// Check to see if mouse is over a button
// scr_gui_button_state(panel)
var panel = argument0;

//Exit if panel is not displayed
if(panel!=noone && panel[4]){

    var xhover = false;
    var yhover = false;
    var button_x = 0;
    var button_y = 0;
    var button_w = 0;
    var button_h = 0;
    var staged_buttons = panel[8];
    var thebutton;
    var guix = device_mouse_x_to_gui(0);
    var guiy = device_mouse_y_to_gui(0);
    
    if(staged_buttons != noone){
        for(var i = 0; i<array_length_1d(staged_buttons); i++){
            thebutton = staged_buttons[i];
            if(thebutton[BTN_SHOW]){
                button_x = thebutton[0];
                button_y = thebutton[1];
                button_w = thebutton[2];
                button_h = thebutton[3];   
                xhover = ( guix == median(button_x, guix, button_x + button_w) );
                yhover = ( guiy == median(button_y, guiy, button_y + button_h) );
                thebutton[@ 4] = xhover && yhover;
            }
        }
    }
    
    var cancel_button = panel[6];
    if(cancel_button!=noone){
        button_x = cancel_button[0];
        button_y = cancel_button[1];
        button_w = cancel_button[2];
        button_h = cancel_button[3];
        xhover = ( guix == median(button_x, guix, button_x + button_w) );
        yhover = ( guiy == median(button_y, guiy, button_y + button_h) );
        cancel_button[@ 4] = xhover && yhover; 
    }
}

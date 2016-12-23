/// Check if a button in the panel was clicked. Run this in the Global Left Button Press event
// scr_gui_button_click(panel)
var p = argument0;
if(p!=noone && p[4]){

/***
    var cb = p[6];// Close panel (cancel) button
    if(cb[4]){
        p[@ 4]=false; // Close panel
    }
***/

    var staged_buttons = p[8];
    var btn;
    if(staged_buttons!=noone){
        for(var i=0; i<array_length_1d(staged_buttons); i++){
            btn=staged_buttons[i];
            if(btn[4]){
                return i;// Return  index of clicked button.
            }
        }
    }   
}

return noone;



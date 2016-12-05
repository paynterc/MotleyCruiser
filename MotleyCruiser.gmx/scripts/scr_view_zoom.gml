/// scr_view_zoom(amount, view)
var amount = 1+argument0;
var view = argument1;

// Limit zoom amount
if(view_wview[view] <= 64 && amount < 1) exit;
if(view_wview[view] >=1280 && amount > 1) exit;

// Get the offset
var offx = abs(view_wview[view] * amount - view_wview[view]);
var offy =  abs(view_hview[view] * amount - view_hview[view]);

// Scale the view
view_wview[view] *= amount;
view_hview[view] *= amount;

// Adjust the view position based on the scale
if(amount<1){
    view_xview[view] += offx/2;
    view_yview[view] += offy/2;
}else if(amount>1){
    view_xview[view] -= offx/2;
    view_yview[view] -= offy/2;
}

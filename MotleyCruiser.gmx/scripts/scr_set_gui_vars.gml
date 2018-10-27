/****
Set reference variables for gui width, center, etc
****/
// Start in window mode and save these widths. 
// Setting gui size here will set save the gui size even if we change to fullscreen
// we should always start in window mode to get gui size right.
display_set_gui_size(window_get_width(),window_get_height());

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
global.gui_width = gui_width;
global.gui_height = gui_height;


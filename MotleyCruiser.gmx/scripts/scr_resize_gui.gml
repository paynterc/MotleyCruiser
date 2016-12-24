/// Set GUI size

display_set_gui_size(1280, 960);

/***
var a = application_get_position();
var xx = a[0];
var yy = a[1];
var ww = a[2] - a[0];
var hh = a[3] - a[1];

display_set_gui_size(ww, hh);
***?



/****
var base_w = 711;
var base_h = 711;
var aspect = display_get_width() / display_get_height();
if (aspect > 1)
{
    //landscape
    display_set_gui_size(base_h * aspect, base_h);
}
else
{
    //portrait
    display_set_gui_size(base_w, base_w / aspect);
}
****

/// Create  background. Be sure to delete this background on Room End.

var dim = argument0;
var bg_color = argument1;

var col1 = make_color_hsv(random(255), 50, random_range(50,255));
var col2 = make_color_hsv(random(255), 50, random_range(50,255));
var col3 = make_color_hsv(random(255), 50, random_range(50,255));
var pps = irandom(100);// points per surface

var surface = surface_create(dim,dim);
surface_set_target  (surface);

draw_clear_alpha(bg_color,.5);

for (var i=1;i<pps;i++){
    draw_point_colour(irandom(dim),irandom(dim),choose(col1,col2,col3));
}
 
var bg = background_create_from_surface(surface,0,0,dim,dim,0,0);

surface_reset_target();
surface_free(surface);

return bg;

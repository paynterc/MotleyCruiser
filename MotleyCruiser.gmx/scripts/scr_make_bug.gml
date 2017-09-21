/// Make a random bug template
var bug = scr_bug();

// Max/min dimensions
var d_max = 4;
var d_min = 1;

bug[BUG_W_LOW]=irandom_range(d_min,d_max);
bug[BUG_W_HIGH]=bug[BUG_W_LOW] + 2;
bug[BUG_H_LOW]=irandom_range(d_min,d_max);
bug[BUG_H_HIGH]=bug[BUG_H_LOW] + 2;
bug[BUG_WING_SHAPE]=choose("rectangle","circle","elipse","triangle");
bug[BUG_WING_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
bug[BUG_WING_COLOR2]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
bug[BUG_WING_COUNT]=irandom(2)+1;
bug[BUG_BODY_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
bug[BUG_BODY_SHAPE]=choose("rectangle","triangle","circle");

return bug;

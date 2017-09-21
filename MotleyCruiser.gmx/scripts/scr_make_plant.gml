/// Make a random plant template
var plant = scr_plant();

// Max/min dimensions
var d_max = 64;
var d_min = 4;

plant[PL_W_LOW]=irandom_range(d_min,d_max);
plant[PL_W_HIGH]=plant[PL_W_LOW] + irandom(16);
plant[PL_H_LOW]=irandom_range(d_min,d_max);
plant[PL_H_HIGH]=plant[PL_H_LOW] + irandom(16);
plant[PL_LEAF_SHAPE]=choose("rectangle","circle","elipse","triangle");
plant[PL_LEAF_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
plant[PL_LEAF_COLOR2]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
plant[PL_LEAF_SIZE_LOW]=irandom( min(plant[PL_W_LOW]/2,plant[PL_H_LOW]) );
plant[PL_LEAF_SIZE_HIGH]=plant[PL_LEAF_SIZE_LOW]+irandom(8);
plant[PL_LEAF_COUNT_LOW]=irandom(16);
plant[PL_LEAF_COUNT_HIGH]=plant[PL_LEAF_COUNT_LOW] + irandom(16);
plant[PL_BRANCH_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
plant[PL_BRANCH_COUNT_LOW]=irandom(6);
plant[PL_BRANCH_COUNT_HIGH]=plant[PL_BRANCH_COUNT_LOW]+irandom(6);
plant[PL_BRANCH_SHAPE]=choose("rectangle","triangle","line");

return plant;

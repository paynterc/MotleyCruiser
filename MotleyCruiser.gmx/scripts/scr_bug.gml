/// An array used as a framework to generate random bugs
//scr_bug()
var bug = noone;

bug[BUG_W_LOW]=1;//1,2
bug[BUG_W_HIGH]=4;//Set low to high-2
bug[BUG_H_LOW]=2;
bug[BUG_H_HIGH]=6;
bug[BUG_WING_SHAPE]="square";// square, circle, elipse
bug[BUG_WING_COLOR]=noone;
bug[BUG_WING_COLOR2]=noone;
bug[BUG_WING_COUNT]=noone;// multiply this by two to keep it symetrical
bug[BUG_BODY_COLOR]=noone;
bug[BUG_BODY_SHAPE]="rectangle";// rectangle,triangle,elipse

return bug;

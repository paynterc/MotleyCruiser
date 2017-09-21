var h=irandom_range(p[PL_H_LOW],p[PL_W_HIGH]);// height
var w=irandom_range(p[PL_W_LOW],p[PL_W_HIGH]);// width
var lcount=irandom_range(p[PL_LEAF_COUNT_LOW],p[PL_LEAF_COUNT_HIGH]);
var bcount=irandom_range(p[PL_BRANCH_COUNT_LOW],p[PL_BRANCH_COUNT_HIGH]);

var x1=sw/2;
var y1=sw-2;

var branches = noone;
var b, bx, by, bh, bw;
bx=x1;
by=y1;
bh=h;
bw=choose(6,8);  
branches[0] = scr_array(bx,by,bh,bw,1);     
for(var i=1; i<=bcount; i++){
    bw= choose(2,4);
    var dir=choose(-1,1);
    bx=x1 + irandom(round(w/2)) * dir;
    by=y1 - round(h/2) - (irandom(round(h/2)));            
    branches[i]=scr_array(bx,by,bh,bw,dir);         
}

 
var leaves = noone;
var lsize = 1;
var l, lwidth, lheight, lx, ly;
// leaf = "x1,y1,size";
for(var i=0; i<lcount; i++){
    lwidth=irandom_range(p[PL_LEAF_SIZE_LOW],p[PL_LEAF_SIZE_HIGH]);
    lheight=irandom_range(p[PL_LEAF_SIZE_LOW],p[PL_LEAF_SIZE_HIGH]);
    dir = choose(-1,1);
    var lx= x1 + irandom(round(w/2)) * dir;
    var ly= ( y1 - h ) - irandom(round(h/2));
    leaves[i]= scr_array(lx,ly,lwidth,lheight);
}
        
var leaves2 = noone;
for(var i=0; i< max(lcount-2,2); i++){
    lwidth=irandom_range(p[PL_LEAF_SIZE_LOW],p[PL_LEAF_SIZE_HIGH]);
    lheight=irandom_range(p[PL_LEAF_SIZE_LOW],p[PL_LEAF_SIZE_HIGH]);
    dir = choose(-1,1);
    var lx= x1 + irandom(round(w/2)) * dir;
    var ly= ( y1 - h ) - irandom(round(h/2));
    leaves2[i]= scr_array(lx,ly,lwidth,lheight);
}

 

surface_set_target(surf);
draw_clear_alpha( c_black, 0 ); 


// Draw leaves   
for(var i=0;i<lcount;i++){
    l=leaves[i];
    switch(p[PL_LEAF_SHAPE]){
        case "circle":
            //draw circle
            draw_circle_colour(l[0],l[1],l[2]+2,p[PL_LEAF_COLOR],p[PL_LEAF_COLOR],false);
            draw_circle_colour(l[0],l[1],l[2],p[PL_LEAF_COLOR2],p[PL_LEAF_COLOR2],false);
            break;
        case "elipse":
            //draw elipse
            draw_ellipse_colour(l[0]-l[2],l[1]-l[3],l[0]+l[2],l[1]+l[3],p[PL_LEAF_COLOR],p[PL_LEAF_COLOR2],false);
            break;
        case "rectangle":
            draw_rectangle_colour(l[0]-(l[2]/2),l[1]-(l[3]/2),l[0]+(l[2]/2),l[1]+(l[3]/2),p[PL_LEAF_COLOR],p[PL_LEAF_COLOR2],p[PL_LEAF_COLOR],p[PL_LEAF_COLOR2],false);
            break;
        case "triangle":
            draw_triangle_colour(l[0],l[1], l[0]-l[2], l[1]-l[3], l[0]+l[2], l[1]-l[3],p[PL_LEAF_COLOR2],p[PL_LEAF_COLOR],p[PL_LEAF_COLOR],false);
            break;
    
    }
}
 
 
 // Draw branches
 for(var i=0;i<array_length_1d(branches);i++){
     b=branches[i];
     switch(p[PL_BRANCH_SHAPE]){
         case "rectangle":
             draw_rectangle_colour( b[0] - round(b[3]/2), b[1], b[0]+(b[3]),b[1]-b[2],p[PL_BRANCH_COLOR],p[PL_BRANCH_COLOR],p[PL_BRANCH_COLOR],p[PL_BRANCH_COLOR],false);
             draw_rectangle_colour( b[0] - round(b[3]/2), b[1], b[0]+(b[3]),b[1]-b[2],p[PL_LEAF_COLOR2],p[PL_LEAF_COLOR2],p[PL_LEAF_COLOR2],p[PL_LEAF_COLOR2],true);
             break;
         case "triangle":
             draw_triangle_colour(b[0] - round(b[3]/2),b[1], b[0], b[1]-b[2], b[0] + round(b[3]/2), b[1],p[PL_BRANCH_COLOR],p[PL_LEAF_COLOR],p[PL_LEAF_COLOR],false);
             break;
         case "line":
             draw_line_width_colour(x1,b[1],b[0],b[1]-b[2],b[3],p[PL_BRANCH_COLOR],p[PL_BRANCH_COLOR]);
             draw_line_width_colour(x1,b[1],b[0],b[1]-b[2],b[3]+1,p[PL_BRANCH_COLOR],p[PL_LEAF_COLOR2]);
             break;
         
         }
 }
 
 
 // Draw leaves2  
 for(var i=0;i<array_length_1d(leaves2);i++){
     l=leaves2[i];
     switch(p[PL_LEAF_SHAPE]){
         case "circle":
             //draw circle
             draw_circle_colour(l[0],l[1],l[2]+2,p[PL_LEAF_COLOR],p[PL_LEAF_COLOR],false);
             draw_circle_colour(l[0],l[1],l[2],p[PL_LEAF_COLOR2],p[PL_LEAF_COLOR2],false);
             break;
         case "elipse":
             //draw elipse
             draw_ellipse_colour(l[0]-l[2],l[1]-l[3],l[0]+l[2],l[1]+l[3],p[PL_LEAF_COLOR],p[PL_LEAF_COLOR2],false);
             break;
         case "rectangle":
             draw_rectangle_colour(l[0]-(l[2]/2),l[1]-(l[3]/2),l[0]+(l[2]/2),l[1]+(l[3]/2),p[PL_LEAF_COLOR],p[PL_LEAF_COLOR2],p[PL_LEAF_COLOR],p[PL_LEAF_COLOR2],false);
             break;
         case "triangle":
             draw_triangle_colour(l[0],l[1], l[0]-l[2], l[1]-l[3], l[0]+l[2], l[1]-l[3],p[PL_LEAF_COLOR2],p[PL_LEAF_COLOR],p[PL_LEAF_COLOR],false);
             break;
     
     }
 }

         
 surface_reset_target();
         
 sprite_delete(spr_custom);
 spr_custom = sprite_create_from_surface(surf, 0, 0, sw, sw, 0, 1, sw/2, sw-8);
 sprite_index = spr_custom;

 surface_free(surf);

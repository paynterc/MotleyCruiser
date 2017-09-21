var h=irandom_range(p[BUG_H_LOW],p[BUG_W_HIGH]);// height
var w=irandom_range(p[BUG_W_LOW],p[BUG_W_HIGH]);// width

var x1=sw/2;
var y1=sw-2;



 
var wings = noone;
var lsize = 1;
var lwidth=w;
var l, lheight, lx, ly;
// leaf = "x1,y1,size";
for(var i=0; i<p[BUG_WING_COUNT]; i++){

    lheight=irandom_range(p[BUG_H_LOW],p[BUG_W_HIGH]);
    var ly= ( y1 - h ) - irandom(round(h/2));
    wings[i]= scr_array(ly,lwidth,lheight);
    
}
        

 

surface_set_target(surf);
draw_clear_alpha( c_black, 0 ); 


// Draw wings   
for(var i=0;i<p[BUG_WING_COUNT];i++){
    l=wings[i];
    var wxLeft = x1-round(w/2);
    var wxRight = x1+round(w/2);
    switch(p[BUG_WING_SHAPE]){
        case "circle":
            //draw circle
            
            draw_circle_colour(x1-round(w/2),l[0],l[1],p[BUG_WING_COLOR],p[BUG_WING_COLOR],false);
            draw_circle_colour(x1-round(w/2),l[0],l[1],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],true);
            
            draw_circle_colour(x1+round(w/2),l[0],l[1],p[BUG_WING_COLOR],p[BUG_WING_COLOR],false);
            draw_circle_colour(x1+round(w/2),l[0],l[1],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],true);
            
            break;
        case "rectangle":
            draw_rectangle_colour(wxLeft,l[0],wxLeft-w,l[0]-3,p[BUG_WING_COLOR],p[BUG_WING_COLOR2],p[BUG_WING_COLOR],p[BUG_WING_COLOR2],false);
            draw_rectangle_colour(wxRight,l[0],wxRight+w,l[0]-3,p[BUG_WING_COLOR],p[BUG_WING_COLOR2],p[BUG_WING_COLOR],p[BUG_WING_COLOR2],false);
            break;
        case "triangle":
            draw_triangle_colour(wxLeft,l[0],wxLeft-w, l[0]-1, wxLeft-w, l[0]+1,p[BUG_WING_COLOR2],p[BUG_WING_COLOR],p[BUG_WING_COLOR],false);
            draw_triangle_colour(wxRight,l[0],wxRight+w, l[0]-1, wxRight+w, l[0]+1,p[BUG_WING_COLOR2],p[BUG_WING_COLOR],p[BUG_WING_COLOR],false);
            break;
    
    }
}
 
 

switch(p[BUG_BODY_SHAPE]){
    case "rectangle":
        draw_rectangle_colour( x1 - round(w/2), y1-round(h/2), x1+round(w/2), y1+round(h/2),p[BUG_BODY_COLOR],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],false);
        draw_rectangle_colour( x1 - round(w/2), y1-round(h/2),x1+round(w/2),y1+round(h/2),p[BUG_WING_COLOR],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],true);
        break;
    case "triangle":
        draw_triangle_colour(x1 - round(w/2), y1+round(h/2), x1, y1-round(h/2), x1+round(w/2), y1+round(h/2),p[BUG_BODY_COLOR],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],false);
        break;
    case "circle":
        draw_circle_colour(x1,y1,w,p[BUG_BODY_COLOR],p[BUG_BODY_COLOR],false);
        draw_circle_colour(x1,y1,w,p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],true);
        break;
    
}
 
 
sprite_delete(spr_custom);
spr_custom = sprite_create_from_surface(surf, 0, 0, sw, sw, 0, 1, sw/2, sw/2);

draw_clear_alpha( c_black, 0 );

// Draw wings   
for(var i=0;i<p[BUG_WING_COUNT];i++){
    l=wings[i];
    var wxLeft = x1-round(w/2);
    var wxRight = x1+round(w/2);
    switch(p[BUG_WING_SHAPE]){
        case "circle":
            //draw circle
            
            draw_circle_colour(x1-round(w/2),l[0]+2,l[1],p[BUG_WING_COLOR],p[BUG_WING_COLOR],false);
            draw_circle_colour(x1-round(w/2),l[0]+2,l[1],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],true);
            
            draw_circle_colour(x1+round(w/2),l[0]+2,l[1],p[BUG_WING_COLOR],p[BUG_WING_COLOR],false);
            draw_circle_colour(x1+round(w/2),l[0]+2,l[1],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],true);
            
            break;
        case "rectangle":
            draw_rectangle_colour(wxLeft,l[0]+2,wxLeft-w,l[0]-3+2,p[BUG_WING_COLOR],p[BUG_WING_COLOR2],p[BUG_WING_COLOR],p[BUG_WING_COLOR2],false);
            draw_rectangle_colour(wxRight,l[0]+2,wxRight+w,l[0]-3+2,p[BUG_WING_COLOR],p[BUG_WING_COLOR2],p[BUG_WING_COLOR],p[BUG_WING_COLOR2],false);
            break;
        case "triangle":
            draw_triangle_colour(wxLeft,l[0]+2,wxLeft-w, l[0]-1+2, wxLeft-w, l[0]+1+2,p[BUG_WING_COLOR2],p[BUG_WING_COLOR],p[BUG_WING_COLOR],false);
            draw_triangle_colour(wxRight,l[0]+2,wxRight+w, l[0]-1+2, wxRight+w, l[0]+1+2,p[BUG_WING_COLOR2],p[BUG_WING_COLOR],p[BUG_WING_COLOR],false);
            break;
    
    }
}
 
 

switch(p[BUG_BODY_SHAPE]){
    case "rectangle":
        draw_rectangle_colour( x1 - round(w/2), y1-round(h/2), x1+round(w/2), y1+round(h/2),p[BUG_BODY_COLOR],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],false);
        draw_rectangle_colour( x1 - round(w/2), y1-round(h/2),x1+round(w/2),y1+round(h/2),p[BUG_WING_COLOR],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],true);
        break;
    case "triangle":
        draw_triangle_colour(x1 - round(w/2), y1+round(h/2), x1, y1-round(h/2), x1+round(w/2), y1+round(h/2),p[BUG_BODY_COLOR],p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],false);
        break;
    case "circle":
        draw_circle_colour(x1,y1,w,p[BUG_BODY_COLOR],p[BUG_BODY_COLOR],false);
        draw_circle_colour(x1,y1,w,p[BUG_WING_COLOR2],p[BUG_WING_COLOR2],true);
        break;
    
}
 
 
sprite_add_from_surface(spr_custom, surf, 0, 0, sw, sw, false, false);
   
sprite_index = spr_custom;
 
surface_free(surf);
surface_reset_target();

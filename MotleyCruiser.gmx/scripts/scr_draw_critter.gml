var h=irandom_range(p[CRITTER_H_LOW],p[CRITTER_H_HIGH]);// body height
var w=irandom_range(p[CRITTER_W_LOW],p[CRITTER_W_HIGH]);// body width

var x1=sw/2;
var y1=sw/2;

var draw_tail = (p[CRITTER_BODY_SHAPE] == "rectangle" && !p[CRITTER_SYMETRICAL]);

surface_set_target(surf);
draw_clear_alpha( c_black, 0 ); 



// Draw legs
var mv = 4; // move legs y axis in pixels
var lx = x1-round( w /2 );
var ly = y1+round(h/2);
var lw = max(1,w/p[CRITTER_LEG_COUNT]-1);// leg width
var lh = 8;
var alt = 0;
for(var i=0;i<p[CRITTER_LEG_COUNT];i++){
    
    if( i mod 2 == 0 ){
        alt = 4;
    }else{
        alt = 0;
    }
    
    switch(p[CRITTER_LEG_SHAPE]){

        case "rectangle":
            draw_rectangle_colour(lx,ly-alt,lx+lw,ly+lh-alt,p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR2],false);
            draw_rectangle_colour(lx,ly-alt,lx+lw,ly+lh-alt,p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
            break;
        case "triangle":
            draw_triangle_colour(lx, ly-alt, lx+lw, ly-alt, lx+(lw/2), ly+lh-alt, p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR2],false);
            draw_triangle_colour(lx, ly-alt, lx+lw, ly-alt, lx+(lw/2), ly+lh-alt, p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR2],true);
            break;
    
    }
    
    lx = lx+lw+1;
    
}

//TAIL
var bx = x1 - round( w/2 );
var by = y1 - round( h/2 );
var tl = irandom_range(p[CRITTER_TAIL_L_LOW],p[CRITTER_TAIL_L_HIGH]);
if(draw_tail){
    if(w>h){
        draw_rectangle_colour( x1, by, bx-tl, by+2,p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],false);
        draw_rectangle_colour( x1, by, bx-tl, by+2,p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
    }
}

// BODY
switch(p[CRITTER_BODY_SHAPE]){
    case "rectangle":
        draw_rectangle_colour( bx, by, bx+w, by+h,p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],false);
        draw_rectangle_colour( bx, by, bx+w, by+h,p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],true);
        break;
    case "elipse":
        draw_ellipse_colour(bx, by, bx+w, by+h,p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR],false);
        draw_ellipse_colour(bx, by, bx+w, by+h,p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],true);
        break;
    
}


// HEAD
var hdw = round(w/2) + p[CRITTER_HEAD_SIZE_MOD_W];
var hdh = round(h/2) + p[CRITTER_HEAD_SIZE_MOD_H];
var hdx, hdy;
if(p[CRITTER_SYMETRICAL]){
    hdx = x1 - round( hdw/2 );
    hdy = y1 - round(h/2) - (hdh/2);// top left
}else{
    hdx = x1 + round( w/2 ) - ( hdw/2 );
    hdy = y1 - round(h/2) - (hdh/2);// top left
}
switch(p[CRITTER_HEAD_SHAPE]){
    case "rectangle":
        draw_rectangle_colour( hdx, hdy, hdx+hdw, hdy+hdh, p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],false);
        draw_rectangle_colour( hdx, hdy, hdx+hdw, hdy+hdh, p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
        break;
    case "elipse":
        draw_ellipse_colour( hdx, hdy, hdx+hdw, hdy+hdh, p[CRITTER_LEG_COLOR],p[CRITTER_BODY_COLOR],false);
        draw_ellipse_colour( hdx, hdy, hdx+hdw, hdy+hdh, p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
        break;
    case "circle":
        draw_circle_colour( hdx+round(hdw/2), y1 - round(h/2), hdw/2, p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],false);
        draw_circle_colour( hdx+round(hdw/2), y1 - round(h/2), hdw/2, p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
        break;
    case "triangle":
        draw_triangle_colour(hdx, hdy, hdx+hdw, hdy, hdx+(hdw/2), hdy+hdh, p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],false);
        draw_triangle_colour(hdx, hdy, hdx+hdw, hdy, hdx+(hdw/2), hdy+hdh, p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
        break;
    
}

// HORNS
var hnx, hny, hnsp;
if(p[CRITTER_HAS_HORNS]){
    hnsp = hdw / (p[CRITTER_HORN_COUNT]+1);
    hnx = hdx + hnsp;
    hny = hdy + 1;
    for(var i=1; i<=p[CRITTER_HORN_COUNT]; i++){
        draw_line_colour(hnx,hny,hnx,hny-p[CRITTER_HORN_LENGTH],p[CRITTER_LEG_COLOR],c_white);
        hnx += hnsp;
    }  
}

// TEETH
var ttx, tty, ttsp, ttl;
if(p[CRITTER_HAS_TEETH]){
    ttsp = hdw / (p[CRITTER_TOOTH_COUNT]+1);
    ttx = hdx + ttsp;
    tty = hdy + hdh - 1;
    ttl = irandom(6)+1;
    for(var i=1; i<=p[CRITTER_TOOTH_COUNT]; i++){
        draw_line_colour(ttx,tty,ttx,tty+ttl,c_white,c_white);
        ttx += ttsp;
    }  
}

// eyes
var esp = hdw / (p[CRITTER_EYE_COUNT]+1);
var ex = hdx + esp;
var ey = hdy + round(hdh/2);
for(var i=1; i<=p[CRITTER_EYE_COUNT]; i++){
    draw_point_colour(ex,ey,p[CRITTER_EYE_COLOR]);
    ex += esp;
}





sprite_delete(spr_custom);
spr_custom = sprite_create_from_surface(surf, 0, 0, sw, sw, 0, 1, sw/2, y1+(h/2)-8);

draw_clear_alpha( c_black, 0 );

// Draw legs
lx = x1-round( w /2 ); // reset
for(var i=0;i<p[CRITTER_LEG_COUNT];i++){
    
    if( i mod 2 !=0 ){
        alt = 4;
    }else{
        alt = 0;
    }
    
    switch(p[CRITTER_LEG_SHAPE]){

        case "rectangle":
            draw_rectangle_colour(lx,ly-alt,lx+lw,ly+lh-alt,p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR2],false);
            draw_rectangle_colour(lx,ly-alt,lx+lw,ly+lh-alt,p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
            break;
        case "triangle":
            draw_triangle_colour(lx, ly-alt, lx+lw, ly-alt, lx+(lw/2), ly+lh-alt, p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR2],false);
            draw_triangle_colour(lx, ly-alt, lx+lw, ly-alt, lx+(lw/2), ly+lh-alt, p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR2],true);
            break;
    
    }
    
    lx = lx+lw+1;
    
}
 
// TAIL
if(draw_tail){
    if(w>h){
        draw_rectangle_colour( x1, by, bx-tl, by+2,p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],false);
        draw_rectangle_colour( x1, by, bx-tl, by+2,p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
    }
}

// BODY 2
switch(p[CRITTER_BODY_SHAPE]){
    case "rectangle":
        draw_rectangle_colour( bx, by, bx+w, by+h,p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],false);
        draw_rectangle_colour( bx, by, bx+w, by+h,p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],true);
        break;
    case "elipse":
        draw_ellipse_colour(bx, by, bx+w, by+h,p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR],false);
        draw_ellipse_colour(bx, by, bx+w, by+h,p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],true);
        break;
    
}


// HEAD
if(p[CRITTER_SYMETRICAL]){
    hdx = x1 - round( hdw/2 );
    hdy = y1 - round(h/2) - (hdh/2);// top left
}else{
    hdx = x1 + round( w/2 ) - ( hdw/2 );
    hdy = y1 - round(h/2) - (hdh/2);// top left
}
switch(p[CRITTER_HEAD_SHAPE]){
    case "rectangle":
        draw_rectangle_colour( hdx, hdy, hdx+hdw, hdy+hdh, p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],false);
        draw_rectangle_colour( hdx, hdy, hdx+hdw, hdy+hdh, p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
        break;
    case "elipse":
        draw_ellipse_colour( hdx, hdy, hdx+hdw, hdy+hdh, p[CRITTER_LEG_COLOR],p[CRITTER_BODY_COLOR],false);
        draw_ellipse_colour( hdx, hdy, hdx+hdw, hdy+hdh, p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
        break;
    case "circle":
        draw_circle_colour( hdx+round(hdw/2), y1 - round(h/2), hdw/2, p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],false);
        draw_circle_colour( hdx+round(hdw/2), y1 - round(h/2), hdw/2, p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
        break;
    case "triangle":
        draw_triangle_colour(hdx, hdy, hdx+hdw, hdy, hdx+(hdw/2), hdy+hdh, p[CRITTER_BODY_COLOR],p[CRITTER_BODY_COLOR],p[CRITTER_LEG_COLOR2],false);
        draw_triangle_colour(hdx, hdy, hdx+hdw, hdy, hdx+(hdw/2), hdy+hdh, p[CRITTER_LEG_COLOR],p[CRITTER_LEG_COLOR2],p[CRITTER_LEG_COLOR2],true);
        break;
    
}

// HORNS 2
if(p[CRITTER_HAS_HORNS]){
    hnsp = hdw / (p[CRITTER_HORN_COUNT]+1);
    hnx = hdx + hnsp;
    hny = hdy + 1;
    for(var i=1; i<=p[CRITTER_HORN_COUNT]; i++){
        draw_line_colour(hnx,hny,hnx,hny-p[CRITTER_HORN_LENGTH],p[CRITTER_LEG_COLOR],c_white);
        hnx += hnsp;
    }  
}

// TEETH 2
if(p[CRITTER_HAS_TEETH]){
    ttx = hdx + ttsp;
    for(var i=1; i<=p[CRITTER_TOOTH_COUNT]; i++){
        draw_line_colour(ttx,tty,ttx,tty+ttl,c_white,c_white);
        ttx += ttsp;
    }  
}


// EYES 2
ex = hdx + esp;
for(var i=1; i<=p[CRITTER_EYE_COUNT]; i++){
    draw_point_colour(ex,ey,p[CRITTER_EYE_COLOR]);
    ex += esp;
}

 
 
sprite_add_from_surface(spr_custom, surf, 0, 0, sw, sw, false, false);
   
sprite_index = spr_custom;
 
surface_free(surf);
surface_reset_target();

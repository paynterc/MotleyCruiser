/// inventory_draw(x,y, spritebox, sprite_infobox, slot_gap, text_color)
var _x, _y, slot_width, spritebox, sprite_infobox,slot_gap,pre_col;
_x = argument0;
_y = argument1;
spritebox = argument2;
sprite_infobox = argument3;
slot_gap = argument4;
pre_col = draw_get_color();
draw_set_color(argument5);
draw_set_font(fnt_menus_med);

/************************
My additions - pagination
***********************/
start_row = page * rows_per_page;
page_rows = min(rows - start_row,rows_per_page);

/************************
end - pagination
***********************/

var guix=mouse_x;
var guiy=mouse_y;

var slot_height;
slot_width = slot;
//slot_height = slot_h;
slot_height = page_rows;


var j, index;
j = 0
//index = 0;
index = start_index;

var item_id_va;
item_id_va = -1
var sprite;
sprite = spr_ItemIcon_Default
var spr_width, spr_height;
spr_width = sprite_get_width(spritebox)
spr_height = sprite_get_height(spritebox);
var _xb = _x-(spr_width/2);
// Draw boxes
for (i=0; i<slot_height; i+=1)
{
    for (j=0; j<slot_width; j+=1)
    {
        if global.ItemLastSelect = index
        {
           draw_sprite(spritebox,2,_x+((spr_width+slot_gap)*j),_y+((spr_height+slot_gap)*i))
        }
        else
        {
            if index = global.ItemSelected{
               if( point_in_rectangle(guix, guiy, _xb, (_y - (spr_height/2) ) + ((spr_height+slot_gap)*i), _xb + spr_width, (_y + (spr_height/2)) + ((spr_height+slot_gap)*i)) ){
                  if mouse_check_button_pressed(mb_left){
                     global.ItemLastSelect = global.ItemSelected
                  }
                  draw_sprite(spritebox,1,_x+((spr_width+slot_gap)*j),_y+((spr_height+slot_gap)*i))
               }else{
                  draw_sprite(spritebox,0,_x+((spr_width+slot_gap)*j),_y+((spr_height+slot_gap)*i))
               }
            }else{
               draw_sprite(spritebox,0,_x+((spr_width+slot_gap)*j),_y+((spr_height+slot_gap)*i))
            }
        }
        index += 1;
    }
}

index = start_index;
var _yoffset,_xoffset,_texty,_textx;
global.MouseOutside = true;
// Draw items
for (i=0; i<slot_height; i+=1)
{
    for (j=0; j<slot_width; j+=1)
    {
        draw_rectangle( _xb, (_y - (spr_height/2) ) + ((spr_height+slot_gap)*i), _xb + spr_width, (_y + (spr_height/2)) + ((spr_height+slot_gap)*i), true);
        if point_in_rectangle(guix,guiy, _xb, (_y - (spr_height/2) ) + ((spr_height+slot_gap)*i), _xb + spr_width, (_y + (spr_height/2)) + ((spr_height+slot_gap)*i)){
           global.ItemSelected = index;// Hovering over item
           global.MouseOutside = false;        
        }

        if ds_map_find_value(global.inventory,"slot"+string(index)) = true{
           item_id_va = ds_map_find_value(global.inventory,"ID"+string(index))
           sprite = ds_map_find_value(global.item_id,"item["+string(item_id_va)+",2]");
           
           var item_width, item_height, item_scale;
           item_width = sprite_get_width(sprite);
           item_height = sprite_get_height(sprite);
           item_scale=ds_map_find_value(global.item_id,"item["+string(item_id_va)+",10]");
           if(is_undefined(item_scale)){
                item_scale=1;
           }
           
        
           _yoffset = (spr_height+slot_gap) * i;
           _textx =  (-spr_width/2) + 4;
           _texty =  (-spr_height/2) + 6;
           
           draw_sprite_ext(sprite, image_index, _x, _y + _yoffset,item_scale,item_scale,0,c_white,1 );
           draw_text(_x + _textx, _y + _yoffset + _texty,string(ds_map_find_value(global.inventory,"Stack"+string(index))));

        }
        index += 1
    };  
};

draw_set_color(pre_col);

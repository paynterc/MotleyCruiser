/// scr_dlg_end_dialogue()
state=noone;
if(shipId!=noone){
    shipId.target = obj_game_control;
    shipId.mode = MODE_TRAVELING;
    shipId=noone;
}            
alarm[0]=room_speed * 1;// Unpause

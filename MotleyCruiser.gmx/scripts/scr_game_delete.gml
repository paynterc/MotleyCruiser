///Delete a saved game from file. This would probably be called from a menu.
// scr_game_delete(GAME_ID)
var game = argument0;
ini_open(SAVE_GAME_FILE);
if( ini_section_exists(game) ){
    ini_section_delete(game);
}
ini_close();


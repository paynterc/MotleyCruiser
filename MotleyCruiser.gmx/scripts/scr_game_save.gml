/**********************
Save the game in its current state to a file

DO NOT SAVE REFERENCES TO SPRITES! THEIR IDS COULD CHANGE. Save a reference to a database record that gets initialized with each
game load.
**********************/
// Create an array for all game data
var game = global.game_loaded;

scr_save_galaxy(game);
scr_inv_save(game);
scr_cargo_save(game);
scr_dsmap_save(global.galaxy_map,"gmap");


scr_write_array(global.equipped,game,"equipped",SAVE_GAME_FILE);
scr_write_array(global.player_ship,game,"player_ship",SAVE_GAME_FILE);
scr_write_array(global.player_model,game,"player_model",SAVE_GAME_FILE);
scr_write_array(global.fleet,game,"fleet",SAVE_GAME_FILE);
scr_write_array(global.missions,game,"missions",SAVE_GAME_FILE);

var spriteString=noone;
var accSpriteString=noone;
for(var i=0; i<array_length_1d(global.crew); i++){
    
    var thisCrew = global.crew[i];
    var thisSprite = scr_get_array_1d(thisCrew,NPC_SPRITE);

    if(sprite_exists(thisSprite)){
        spriteString = sprite_get_name(thisSprite);
    }else{
        spriteString = noone;
    }
    thisCrew[@ NPC_SPRITE_STRING]=spriteString;
    
    var theseAcc = scr_get_array_1d(thisCrew,NPC_ACCESSORIES);
    if(is_array(theseAcc)){

        for(var n=0; n<array_length_1d(theseAcc); n++){
            var thisAcc = theseAcc[n];
            var thisAccSpr = scr_get_array_1d(thisAcc,ACC_SPR_INDEX);
                if(sprite_exists(thisAccSpr)){
                    accSpriteString = sprite_get_name(thisAccSpr);
                }else{
                    accSpriteString = noone;
                }
                thisAcc[@ ACC_SPR_STRING]=accSpriteString;
        }
    }
    
}

scr_write_array(global.player_data,game,"player_data",SAVE_GAME_FILE);
scr_write_array(global.crew,game,"crew",SAVE_GAME_FILE);
scr_write_array(global.team,game,"team",SAVE_GAME_FILE);
//scr_write_array(global.hotbar,game,"hotbar",SAVE_GAME_FILE); this was screwed up. I was saving refrences to sprites
scr_write_array(global.tutorial,game,"tutorial",SAVE_GAME_FILE);
scr_write_array(global.pets,game,"pets",SAVE_GAME_FILE);

ini_open(SAVE_GAME_FILE);
ini_write_real(game,"sector_x",global.sector_x);
ini_write_real(game,"sector_y",global.sector_y);
ini_write_real(game,"player_x",global.player_x);
ini_write_real(game,"player_y",global.player_y);
ini_write_real(game,"galaxy_seed",global.galaxy_seed);
ini_write_real(game,"mission_id",global.mission_id);// Current mission increment
ini_write_real(game,"objective_inc",global.objective_inc);// Current objective increment.
ini_write_real(game,"credits",global.credits);// Current credits.
ini_write_real(game,"supply_food",global.supply_food);// Current supply.
ini_write_real(game,"supply_water",global.supply_water);// Current supply.
ini_write_real(game,"supply_fuel",global.supply_fuel);// Current supply.
ini_write_real(game,"supply_oxygen",global.supply_oxygen);// Current supply.
ini_close();

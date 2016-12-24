/*****
See what is in the saved game file and populate a global variable with available
slots. We can only have three saved games at a time, but any game can be 
deleted
***********/
var games = noone;
games[0]=0;
games[1]=0;
games[2]=0;

ini_open(SAVE_GAME_FILE);
if(ini_section_exists("GAME1")){
    games[0]=1;
}
if(ini_section_exists("GAME2")){
    games[1]=1;
}
if(ini_section_exists("GAME3")){
    games[2]=1;
}
ini_close();

return games;

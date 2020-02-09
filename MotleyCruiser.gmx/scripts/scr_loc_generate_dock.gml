/// scr_loc_generate_dock()
// Generate random data for a station dock
var dock = scr_ent_room();
randomize();
dock[rmm.seed]=random_get_seed();
dock[rmm.w]=7;
dock[rmm.h]=7;
dock[rmm.type]=room_types.dock;

// NPCs
var trader = scr_gx_make_npc(global.sector_x,global.sector_y);
trader[NPC_OCCUPATION]=occupation.merchant;// merchant. see scr_npc_occupation_library 
var shipwright = scr_gx_make_npc(global.sector_x,global.sector_y);
shipwright[NPC_OCCUPATION]=occupation.shipwright;

dock[rmm.npcs]=scr_array(trader,shipwright);

return dock;



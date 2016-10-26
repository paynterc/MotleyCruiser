/// Create data for random npc ship
// scr_make_ship(sector_row, sector_column)
var map = noone;
var sector = noone;
sector[0]=argument0;
sector[1]=argument1;

var sprite_array = noone;
sprite_array[0]=spr_ship_en;
sprite_array[1]=spr_ship_2;


var sprite = sprite_array[ irandom( array_length_1d(sprite_array)-1 ) ];
var turn_spd = irandom_range(global.ship_min_turn_spd,global.ship_max_turn_spd);
var max_spd = irandom_range(global.ship_min_spd,global.ship_max_spd);
var acc_spd_fwd = irandom_range(global.ship_min_acc,global.ship_max_acc);
var shields = irandom_range(global.ship_min_shields,global.ship_max_shields);
var hull = irandom_range(global.ship_min_hull,global.ship_max_hull);
var energy = irandom_range(global.ship_min_energy,global.ship_max_energy);
var weapon_speed = irandom_range(global.ship_min_weapon_spd,global.ship_max_weapon_spd);

var x1 = clamp( irandom(global.sector_width ), 1, global.sector_width );
var y1 = clamp( irandom(global.sector_width ), 1, global.sector_width );

map[SHIP_TURN_SPEED]=turn_spd;
map[SHIP_MAX_SPEED]=max_spd;
map[SHIP_MAX_FWD]=max_spd;
map[SHIP_MAX_RVS]=max_spd;
map[SHIP_ACC_FWD]=acc_spd_fwd;
map[SHIP_ACC_RVS]=acc_spd_fwd -0.5;
map[SHIP_SHIELDS]=shields;
map[SHIP_SHIELDS_REGEN_SPD]=1;
map[SHIP_SHIELDS_REGEN_PTS]=1;
map[SHIP_HULL]=hull;
map[SHIP_ENERGY]=energy;
map[SHIP_ENERGY_REGEN_SPD]=1;
map[SHIP_ENERGY_REGEN_PTS]=1;
map[SHIP_X1]=x1;
map[SHIP_Y1]=y1;
map[SHIP_WEAPON_SPD]=weapon_speed;
map[SHIP_SPRITE_INDEX]=sprite;
map[SHIP_IMAGE_INDEX]=floor(random(sprite_get_number(sprite)-1));
map[SHIP_SECTOR]=sector;
map[SHIP_NPCS] = noone;

return map;

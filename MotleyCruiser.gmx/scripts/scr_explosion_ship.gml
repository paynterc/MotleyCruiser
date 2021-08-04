/// scr_explosion_ship(x,y)
var xx = argument0;
var yy = argument1;

part_particles_create(global.Particles, xx, yy, global.ptcl_expld1, 5);
var expl = instance_create(xx,yy,obj_explosion2);
expl.image_xscale = 3;
expl.image_yscale = 3;
expl.image_angle = irandom_range(0,359);
expl.image_speed = 30/room_speed;

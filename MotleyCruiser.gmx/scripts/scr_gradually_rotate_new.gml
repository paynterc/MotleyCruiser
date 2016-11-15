// gradually_turn.gml
// --------
// Gradually turns an object towards its target
//

// FORMAT:
// gradually_turn(objToTurn, target, turnSpeed, accuracy);
//
// <objToTurn> takes an object
// <target> takes an object
// <turnSpeed> takes a number
// <accuracy> takes a number between 0 and 1

var ob = argument0;
var tg = argument1;
var rspd = argument2;//1-10
var accy = clamp(argument3,.05,10);// Don't want perfect accuracy or perfect inaccuracy

var pointdir = point_direction(ob.x,ob.y,tg.x,tg.y);
//show_debug_message("pd-ta: "+string(pointdir-ob.image_angle));
//show_debug_message("degtorad: "+string(degtorad(pointdir-ob.image_angle)));
var diff = pointdir-ob.image_angle;
var d2r = degtorad(diff+accy);

ob.image_angle += sin(degtorad(diff+accy)) * rspd;
return diff;

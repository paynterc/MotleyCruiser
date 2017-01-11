/// Defaults for mission objective
var ob = noone;

global.objective_inc++;

ob[OBJECTIVE_DESCRIPTION]=noone;
ob[OBJECTIVE_ACHIEVED]=false;
ob[OBJECTIVE_TYPE]=noone;// deliver, speak, aquire, return, kill_name, kill_x_of_y
ob[OBJECTIVE_TARGET_TYPE]=noone;// npc, planet, station. use to choose which directory to look in.
ob[OBJECTIVE_TARGET_INDEX]=noone;// Index of the target in their directory.
ob[OBJECTIVE_TARGET_COUNT]=1;// Count of targets required. For kill_x_of_y.
ob[OBJECTIVE_REQUIRED_INVENTORY]=noone;// An index number from item library.
ob[OBJECTIVE_REQUIRED_INVENTORY_COUNT]=1;// Count of required item needed.
ob[OBJECTIVE_STATE]="inactive"; // inactive, active, completed, failed
ob[OBJECTIVE_SCRIPT_END]=noone; // Remove an item on completion of the objective.
ob[OBJECTIVE_TARGET_COUNT_CURRENT]=0;// Count of targets eliminated. Increment on each kill.
ob[OBJECTIVE_MISSION_ID]=noone;
ob[OBJECTIVE_ID]="ob-"+string(global.objective_inc);
ob[OBJECTIVE_TARGET_FACTION]=noone;// for kill_x_of_y objectives.
ob[OBJECTIVE_REQUIRED_NPC]=noone;// Index number for an npc that must be in your crew or passenger list.
ob[OBJECTIVE_TEXT_END]="Our business is complete.";// Text at the completion of objective
return ob;

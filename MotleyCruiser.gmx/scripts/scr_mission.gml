/// Defaults for mission record
var mission = noone;
/**
Whenever something happens in your game that can be relevant for a quest, raise an event.
Define classes for your quests with event listeners to react to these events.
Store the currently active quests (and their status and parameters) in a database
When initializing your game state, also initialize quest objects for each active quest of the player
Register the quest objects' event listeners at your game state object
**/

mission[MISSION_ID]=noone;
mission[MISSION_NAME]=noone;
mission[MISSION_TEXT]=noone;
mission[MISSION_DESCRIP]=noone;
mission[MISSION_TYPE]=noone;//deliver,aquire,killname,killx,findname,escortship,passenger
mission[MISSION_START_LOCATION]=noone;
mission[MISSION_END_LOCATION]=noone;
mission[MISSION_REWARD]=noone;//money, item, tip
mission[MISSION_OBJECTIVES]=noone;// Achieve all objectives to receive reward. 1)kill x. 2)return to npc.
mission[MISSION_STATE]="inactive";// inactive, active, completed, failed
mission[MISSION_GRANT_INVENTORY_START]=noone; // Grant an item on start of the mission
mission[MISSION_SCRIPT_START]=noone;
mission[MISSION_GRANTED_BY]=noone;//ID of NPC that granted the mission

return mission;

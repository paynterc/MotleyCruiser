/// scr_mission_update_deliver_cargo(commodityKey,qty)
if(debug_mode){ show_debug_message("DEBUG: Deliver Cargo MISSION UPDATE") }

var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var commodityKey = args[0];
var qty = args[1];

if(commodityKey == noone || qty==noone){
    if(debug_mode){ show_debug_message("DEBUG: Deliver Cargo error. Missing arguments.") }
    return false;
}else{
    if(debug_mode){ show_debug_message("DEBUG: Deliver Cargo. Commodity:" + string(commodityKey) + " qty:" + string(qty)) }
}
// Iterate over missions
for (var k = ds_map_find_first(global.mission_map); !is_undefined(k); k = ds_map_find_next(global.mission_map, k)) {

    var mission = global.mission_map[? k];
    if(debug_mode){ show_debug_message("DEBUG: Checking mission: " + string(mission[? "id"]) ) }
    if(!mission[? "complete"]){
        
        // Get the current objective
        var currentObjective = scr_mission_objective_current(mission);
        if(is_undefined(currentObjective)) continue;
        if(debug_mode){ show_debug_message("DEBUG: Checking objective: " + string(currentObjective[? "description"]) ) }
        var type = currentObjective[? "type"];
        if(type==missionTypes.deliverCargo){
            var msnCommodityKey = currentObjective[? "commodityKey"];
            var msnCommodityQty = currentObjective[? "commodityQty"];
            var sectorX = currentObjective[? "sectorX"];
            var sectorY = currentObjective[? "sectorY"];

            if( !is_undefined(msnCommodityKey) && !is_undefined(msnCommodityQty) ){
            
                if(msnCommodityKey==commodityKey){
                    currentObjective[? "commodityQtyRemaining"] = max(0, currentObjective[? "commodityQtyRemaining"]-qty);
                    if(debug_mode){ show_debug_message("DEBUG: Mission commodityQtyRemaining set to: " + string(currentObjective[? "commodityQtyRemaining"]) ) }
                    scr_flybark("MISSION UPDATE: " + mission[? "name"] + ". " + string(currentObjective[? "commodityQty"] - currentObjective[? "commodityQtyRemaining"]) + " of " + string(currentObjective[? "commodityQty"]) + ".");
                    if(currentObjective[? "commodityQtyRemaining"] <= 0){
                        currentObjective[? "complete"]=true;        
                        if(mission[? "stageCount"] > 1 ){
                            mission[? "stage"] = min(mission[? "stage"] +1, mission[? "stageCount"]);
                            if(debug_mode){ show_debug_message("DEBUG: MISSION STAGE HAS BEEN UPDATED TO: " + string(mission[? "stage"])) }
                        }else{
                            scr_mission_complete(mission[? "id"]);
                        }
                    }
                }
            }
        }
  }
      
}


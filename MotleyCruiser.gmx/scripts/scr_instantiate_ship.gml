/*****
Instantiates the module objects for the ship object
The progression should be 
SET FACTION
scr_instatiate_ship()->
    scr_module_modify_stats()->
        ship_data = scr_modules_to_ship_data(ship_data)
        
        THEN
scr_update_ship_data() (for new ship)
OR
scr_restore_ship_state() (when loading player ship and fleet in new room)

After instantiating modules and updating ship stats for the first time, I put the stats back into the ship_data  
using scr_update_ship_data so we get a starting shield and hull amount.

Ship stats are the raw variables that exist in the ship object. Ship data is an array containing module and ship info.

Use scr_update_ship_data whenever you leave a sector, so we can record losses to shield and hull.

Once the new sector is loaded, use scr_restore_ship_state to move shield and hull data back into ship stats.
*****/

// scr_instantiate_ship(ship_data)

module_data = ship_data[SHIP_MODULES];
modules = noone;
var mag = ship_data[SHIP_SCAFFOLD_SIZE];// Assume scaffolds are of equal height and width. 3x3,5x5,7x7
var m_object = noone;
// Set offsets for each module_record according to their scaffold coordinates
var m_object;
for(var m=0; m<array_length_1d(module_data); m++){
    
    m_object = scr_instantiate_module(module_data[m],mag);
    if(m_object==noone){
        continue;
    }
    modules[m]=m_object.id; 
    m_object.parent_obj = id;
}

// Now modify the ship stats based on installed modules
scr_module_modify_stats();

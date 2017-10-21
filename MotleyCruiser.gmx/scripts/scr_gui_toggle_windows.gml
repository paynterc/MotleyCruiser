/*************
Close windows based on what is currently showing
************/
var open = argument0;

obj_message_box.show = false;

scr_gui_set_context(open);

switch (open)
{
    case "inventory":
        obj_mission_log.show = false;
        obj_trade.show=false;
        if(instance_exists(obj_dialog_control)){
            obj_dialog_control.show="false";
        }
        break;
    case "mission":
        obj_inventory.show = false;
        obj_trade.show=false;
        if(instance_exists(obj_dialog_control)){
            obj_dialog_control.show="false";
        }
        break;
    case "trade":
        obj_inventory.show = false;
        obj_mission_log.show=false;
        if(instance_exists(obj_dialog_control)){
            obj_dialog_control.show="false";
        }
        break;
    case "all":
        obj_inventory.show = false;
        obj_mission_log.show=false;
        obj_trade.show=false;
        if(instance_exists(obj_dialog_control)){
            obj_dialog_control.show="false";
        }

        break;
}



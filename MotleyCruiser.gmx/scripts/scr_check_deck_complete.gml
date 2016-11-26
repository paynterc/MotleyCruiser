/// See if all enemies defeated on this deck
if(instance_number(obj_enemy)<1){
   // if done, activate door to next deck.
   show_message("DECK COMPLETE");
   if(instance_exists(obj_door)){
        instance_activate_object(obj_door);
   }   
}

 /// Create dialog for an npc so that player can interact. Provide missions, tips, items, etc.
 // expects npc to have a "mission" variable, possibly tip. Possibly randomize dialogue or set according to race, personality, level, etc.

var tree = noone;
var buttons = noone;
var branches = noone;
var i=0;
var obj_for_mission = noone;

// Add branch 0
tree[i] = scr_make_dialogue_branch("I find peace in the solitude of space, but I sometimes enjoy the company of fellow travelers.","intro");

// Add buttons.


staged_objectives = scr_get_entity_objectives("npc",global_index);// get active objectives for this npc. npc must be target of an ACTIVE objective

if(staged_objectives != noone){

    for(var ob = 0; ob<array_length_1d(staged_objectives); ob++){
        objv=staged_objectives[ob];
        /***
        if(mission!=noone && objv[OBJECTIVE_MISSION_ID] == mission[MISSION_ID]){
            obj_for_mission = objv;//player has this npc's mission and the npc is the target of the ACTIVE objective (probably to complete mission).
        }
        ***/
        scr_add_dialogue_button(tree[i],"I have business with you (mission id: "+ string(objv[OBJECTIVE_MISSION_ID])+").","complete_objective",0,noone,objv[OBJECTIVE_ID]);

    }
    
}


scr_add_dialogue_button(tree[i],"Do you have any work that needs doing?", "step_to",i+1);
scr_add_dialogue_button(tree[i],"Do you have any tips?", "step_to",i+2);
scr_add_dialogue_button(tree[i],"Tell me about your home world.", "step_to",i+3);
scr_add_dialogue_button(tree[i],"Good Bye.", "exit",noone);



// Add branch 1
i++;
if(mission != noone){
    tree[i] = scr_make_dialogue_branch(mission[MISSION_TEXT],"job");
    scr_add_dialogue_button(tree[i],"I'll do it","accept_mission",0);
}else{
    tree[i] = scr_make_dialogue_branch("I got nothin' for ya.","job");
    scr_add_dialogue_button(tree[i],"Ooookay","step_to",0);
}


// Add branch 2
i++;
tree[i] = scr_make_dialogue_branch("There's a guy one system away selling grain at half the market price","tip");
scr_add_dialogue_button(tree[i],"Thank you.","step_to",0);

// Add branch 3
i++
tree[i] = scr_make_dialogue_branch("My world is a cold and brutal place. Only the strong survive and do so unhappily. 
I am grateful to that I am able to travel to the stars and am not bound to that unpleasant rock.","exposition");
scr_add_dialogue_button(tree[i],"Tell me more.","step_to",i+1);
scr_add_dialogue_button(tree[i],"What does love mean to you.","step_to",i+2);
scr_add_dialogue_button(tree[i],"Whatever.","step_to",0);

//Add sub-branch
i++;
tree[i] = scr_make_dialogue_branch("There is nothing more to tell. May you never need to visit that place.","exposition");
scr_add_dialogue_button(tree[i],"Same to you.","step_to",0);
scr_add_dialogue_button(tree[i],"I'd like to talk some more about this.","step_to",i-1);

//Add sub-branch
i++;
tree[i] = scr_make_dialogue_branch("Some say love, it is a river that drowns the tender reed.","exposition");
scr_add_dialogue_button(tree[i],"That's enough of that.","step_to",0);
scr_add_dialogue_button(tree[i],"Let me ask you something else about this.","step_to",i-2);

return tree;

 /// Create dialog for an npc so that player can interact. Provide missions, tips, items, etc.
 // expects npc to have a "mission" variable, possibly tip. Possibly randomize dialogue or set according to race, personality, level, etc.

var tree = noone;
var buttons = noone;
var branches = noone;
var i=0;

// Add branch 0
tree[i] = scr_make_dialogue_branch("I find peace in the solitude of space, but I sometimes enjoy the company of fellow travelers.","intro");

// Add buttons.
tree[i] = scr_add_dialogue_button(tree[i],"Do you have any work that needs doing?", "step_to",i+1);
tree[i] = scr_add_dialogue_button(tree[i],"Do you have any tips?", "step_to",i+2);
tree[i] = scr_add_dialogue_button(tree[i],"Tell me about your home world.", "step_to",i+3);
tree[i] = scr_add_dialogue_button(tree[i],"Good Bye.", "exit",noone);

// Add branch 1
i++;
if(mission != noone){
    if(scr_has_mission(mission)){
        tree[i] = scr_make_dialogue_branch("Did you do that thing yet?","exposition");
        tree[i] = scr_add_dialogue_button(tree[i],"Nope.","step_to",0);
    }else{
        tree[i] = scr_make_dialogue_branch(mission[? "text"],"job");
        tree[i] = scr_add_dialogue_button(tree[i],"I'll do it","accept_mission",0);
    }
}else{
    tree[i] = scr_make_dialogue_branch("I got nothin' for ya.","job");
    tree[i] = scr_add_dialogue_button(tree[i],"Ooookay","step_to",0);
}


// Add branch 2
i++;
tree[i] = scr_make_dialogue_branch("There's a guy one system away selling grain at half the market price","tip");
tree[i] = scr_add_dialogue_button(tree[i],"Thank you.","step_to",0);

// Add branch 3
i++
tree[i] = scr_make_dialogue_branch("My world is a cold and brutal place. Only the strong survive and do so unhappily. 
I am grateful to that I am able to travel to the stars and am not bound to that unpleasant rock.","exposition");
tree[i] = scr_add_dialogue_button(tree[i],"Tell me more.","step_to",i+1);
tree[i] = scr_add_dialogue_button(tree[i],"What does love mean to you.","step_to",i+2);
tree[i] = scr_add_dialogue_button(tree[i],"Whatever.","step_to",0);

//Add sub-branch
i++;
tree[i] = scr_make_dialogue_branch("There is nothing more to tell. May you never need to visit that place.","exposition");
tree[i] = scr_add_dialogue_button(tree[i],"Same to you.","step_to",0);
tree[i] = scr_add_dialogue_button(tree[i],"I'd like to talk some more about this.","step_to",i-1);

//Add sub-branch
i++;
tree[i] = scr_make_dialogue_branch("Some say love, it is a river that drowns the tender reed.","exposition");
tree[i] = scr_add_dialogue_button(tree[i],"That's enough of that.","step_to",0);
tree[i] = scr_add_dialogue_button(tree[i],"Let me ask you something else about this.","step_to",i-2);

return tree;

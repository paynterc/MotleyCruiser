 /// Create dialog for an npc so that player can interact. Provide missions, tips, items, etc.

var buttons = noone;
var branches = noone;


var tree = scr_make_dialogue_branch("I find peace in the solitude of space, but I sometimes enjoy the company of fellow travelers.","intro");

// Add buttons.
tree = scr_add_dialogue_button(tree,"Do you have any work that needs doing?", "step_down");
tree = scr_add_dialogue_button(tree,"Do you have any tips?", "step_down");
tree = scr_add_dialogue_button(tree,"Tell me about your home world.", "step_down");
tree = scr_add_dialogue_button(tree,"Good Bye.", "exit");

// Add branches

var branch0 = scr_make_dialogue_branch("I need you to take a thing to this guy at this place","job");
branch0 = scr_add_dialogue_button(branch0,"I'll do it","intro");
//branch0 = scr_add_dialogue_button(branch0,"No way.","intro");

var branch1 = scr_make_dialogue_branch("There's a guy one system away selling grain at half the market price","tip");
branch1 = scr_add_dialogue_button(branch1,"Thank you.","intro");

var branch2 = scr_make_dialogue_branch("My world is a cold and brutal place. Only the strong survive and do so unhappily. 
I am grateful to that I am able to travel to the stars and am not bound to that unpleasant rock.","exposition");
branch2 = scr_add_dialogue_button(branch2,"Tell me more.","step_down");
branch2 = scr_add_dialogue_button(branch2,"What does love mean to you.","step_down");
branch2 = scr_add_dialogue_button(branch2,"Whatever.","intro");

//Add sub-branch
var branch2_1 = scr_make_dialogue_branch("There is nothing more to tell. May you never need to visit that place.","exposition");
branch2_1 = scr_add_dialogue_button(branch2_1,"Same to you.","intro");
var branches2 = noone;
branches2[0]=branch2_1;
branch2[? "branches"] = branches2;


branches[0] = branch0;
branches[1] = branch1;
branches[2] = branch2;

// Add the branches to the tree
tree[? "branches"] = branches;

return tree;

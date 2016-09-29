/// Create a single node or branch of the dialogue tree with text, buttons and branches
// scr_make_dialogue_branch(Text, Type);

var branch = noone;

branch[D_BRANCH_TEXT]=argument0;
branch[D_BRANCH_TYPE]=argument1;//intro, job, tip, hire, trade, exposition
branch[D_BRANCH_BUTTONS]=noone;

return branch;

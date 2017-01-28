/// A list of possible npc traits
// scr_npc_traits_library()
// The keys in this array are important.
// NPCs receive the numerical key, not the text value of the trait

var t = noone;

t[0,0]=TRAIT_KIND;
t[0,1]=TRAIT_CRUEL;
t[1,0]=TRAIT_GENEROUS;
t[1,1]=TRAIT_GREEDY;
t[2,0]=TRAIT_BRAVE;
t[2,1]=TRAIT_COWARDLY;
t[3,0]=TRAIT_AGGRESSIVE;
t[3,1]=TRAIT_PASSIVE;
t[4,0]=TRAIT_HONEST;
t[4,1]=TRAIT_DISHONEST;
t[5,0]=TRAIT_LOYAL;
t[5,1]=TRAIT_TREACHEROUS;
t[6,0]=TRAIT_HUMBLE;
t[6,1]=TRAIT_ARROGANT;
t[7,0]=TRAIT_MORAL;
t[7,1]=TRAIT_IMMORAL;

global.npc_traits=t;


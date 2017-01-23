/*****
Global library of possible dialog responses.

scr_define_sentence:
map[0]=noone; // DIA_RESP_TXT: "Hello there, [#replace1#]" 
map[1]=noone; // DIA_RESP_TYPE: intro,farewell,tip,exposition,rebuff
map[2]=noone; // DIA_RESP_SUBTYPE: expo-homeworld, expo-personal, expo-team, expo-motivation
map[3]=noone; // DIA_RESP_DISPOSITION: 0=friendly, 1=neutral, 2=hostile
map[4]=noone; // DIA_RESP_RACE
map[5]=noone; // DIA_RESP_PART: Placement
map[6]=noone; // DIA_RESP_TAG: rude, pleasant, arrogant

*****/
// scr_sentences()

global.dialogue_sentences = noone;


// INTRODUCTIONS
var intros = noone;
var sentence;

sentence = scr_define_sentence("Hello, [#name#].", "intro", noone, 1);
intros = scr_push_array(intros,sentence);

sentence = scr_define_sentence("Greetings, [#name#].", "intro", noone, 1);
intros = scr_push_array(intros,sentence);

sentence = scr_define_sentence("Salutations, [#name#].", "intro", noone, 1);
intros = scr_push_array(intros,sentence);

sentence = scr_define_sentence("Yes, [#name#]?", "intro", noone, 1);
intros = scr_push_array(intros,sentence);

sentence = scr_define_sentence("What do you need?", "intro", noone, 1);
intros = scr_push_array(intros,sentence);

sentence = scr_define_sentence("What do you want?", "intro", noone, 1);
intros = scr_push_array(intros,sentence);

sentence = scr_define_sentence("What can I do for you?", "intro", noone, 0);
intros = scr_push_array(intros,sentence);

sentence = scr_define_sentence("How may I be of assistance?", "intro", noone, 0);
intros = scr_push_array(intros,sentence);

sentence = scr_define_sentence("I thought I could smell a [#name#].", "intro", noone, 2);
intros = scr_push_array(intros,sentence);

sentence = scr_define_sentence("I'm busy, [#name#], make it quick.", "intro", noone, 2);
intros = scr_push_array(intros,sentence);

sentence = scr_define_sentence("I do not have much time for you, [#name#]. This had better be important.", "intro", noone, 2);
intros = scr_push_array(intros,sentence);

global.dialogue_sentences[0] = intros;


// FAREWELLS
var farewells = noone;

sentence = scr_define_sentence("Good luck, deebaag!", "farewell", noone, 2);
farewells = scr_push_array(farewells,sentence);

sentence = scr_define_sentence("Sayonara, sucker!", "farewell", noone, 2);
farewells = scr_push_array(farewells,sentence);

sentence = scr_define_sentence("Drift, loser.", "farewell", noone, 2);
farewells = scr_push_array(farewells,sentence);

global.dialogue_sentences[1] = farewells;

/*****
var intros_racist_friend= noone;
sentence = scr_define_sentence("I may be able to help you, [#name#], but your [#race#] friend will need to wait outside.", "intro", noone, 2);
intros_racist_friend = scr_push_array(intros_racist_friend,sentence);

global.dialogue_sentences[1] = intros_racist_friend;
*****/

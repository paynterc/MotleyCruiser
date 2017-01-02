/// Global library of possible dialog responses.
global.dialogue_sentences = noone;

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

var intros_racist_friend= noone;
sentence = scr_define_sentence("I may be able to help you, [#name#], but your [#race#] friend will need to wait outside.", "intro", noone, 2);
intros_racist_friend = scr_push_array(intros_racist_friend,sentence);

global.dialogue_sentences[1] = intros_racist_friend;


///scr_stringtowords(string)
var str = argument0;
var size = string_length(str);
var words = undefined;
words[0] = "";
var w = 0;
for(var i = 1; i <= size; i++) //for every character in string
{
 var ch = string_char_at(str, i);
 if (ch == " ") //if space found
 {
  words[++w] = ""; //new word
 }
 else
 {
  words[w] += ch;//add character
 }
}
return words;

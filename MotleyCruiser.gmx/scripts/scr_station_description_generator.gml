/// scr_station_description_generator(location data)
/*******

Fat City is a busy station but living conditions are poor. The people here seem tense and
suspicious. The administration of Fat City is corrupt. Gambling, drugs, slavery, piracy, smuggling and deathsport are legal.

legal environment:
gambling: legal/tolerated/illegal
drugs
slavery
piracy
smuggling
deathsport

repressive
permissive
corrupt
lawless

taxes?
invoice vs non-invoiced goods

*******/
var _data = argument0;

var name = _data[LOC_NAME];
var condition = _data[LOC_CONDITION];// good, bad
var attitude = _data[LOC_ATTITUDE];// good, bad (view toward strangers)
var economy = _data[LOC_ECONOMY];
var finalText="";
var cdTxt="";
var attd1="";
var econ1="";

var activityWords = scr_array("a busy","an active","a bustling");

text = name + " is " + scr_array_random(activityWords) + " " + choose("station","place","location","depot");

// Conditions description
var conditionsGood1 = scr_array("good","comfortable");
var conditionsBad1 = scr_array("bad","poor","hard","difficult");

if(condition=="good"){
    cdTxt += "and living conditions here are " + scr_array_random(conditionsGood1) + ".";
}else{
    cdTxt += "but living conditions here are " + scr_array_random(conditionsBad1) + ".";
}


if(attitude=="good"){
    attd1 = "The residents seem " + choose("warm","friendly","cheerful") + " and " + choose("open","inviting","welcoming") + ".";
}else if(attitude=="mixed"){
    attd1 = "The residents seem " + choose("friendly","cheerful","warm") + " " + choose("but","if","though") + " " + choose("suspicious","distant","cautious")+ ".";
}else{
    attd1 = "The residents seem " + choose("grim","distant","cold") + " and " + choose("suspicious","unwelcoming","hostile")+ ".";
}

if(economy==CC_AGRICULTURE){
    econ1=choose("The economy here is agriculturual.","Most people here engage in hydroponic farming.","The primary source of livlihood here is the raising of hydroponic crops and small livestock.")
}else if(economy==CC_MINING){
    econ1=choose("This station has a mining economy.","This station produces minerals and water through mining operations based in local asteroid fields.");
}else if(economy==CC_INDUSTRIAL){
    econ1=choose("This station has an industrial economy.","Most industry here involves manufacturing and the refining of fuel and chemicals.");
}else if(economy==CC_TECH){
    econ1=choose("This station has a tech economy, producing electronics and medicine.");
}else{
    econ1="";
}

rslt = scr_array_concat(scr_array(text,cdTxt,attd1,econ1)," ");

return rslt;


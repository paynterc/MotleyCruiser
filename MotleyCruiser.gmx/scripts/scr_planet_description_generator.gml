/// scr_planet_description_generator(location data)
/*******
Caleb's Undoing is a rocky world. Cold and brutal, the conditions here are poor, yet life finds a way. Plants here are sparse and pale. Animals
are small, mostly subteranean. There is a settlement. The people here seem tense and suspicious. A local superstition
holds that a Crypto Unicorn horn can increase virility.

Fat City is a boggy world. Conditions for life here are poor. Fat city has microbes and plants but no animals. There is one human settlement. The people here seem tense and
suspicious. Local superstition holds that a Crypto Unicorn horn can increase virility

[planet name] is a [terrain] [planet,world,place]. [condionts[[good][a,b,c], [bad][x,y,z]] and [temperature[condionts[[good][a,b,c], [bad][x,y,z]], [life[[yes][goodconditions]['life abounds','exloding with life']['badconditons']['life finds a way']]]

When building a planet, choose temperature first, then life and then terrain.
*******/
var _data = argument0;

var name = _data[LOC_NAME];
var condition = _data[LOC_CONDITION];// good, bad
var terrain = _data[LOC_TERRAIN];// int. enum.terrains (some of these imply life) desert, swampy, hilly, rocky, forested, tundra, river, ocean, glacial, plains
var temperature = _data[LOC_TEMPERATURE];// hot, cold
var life = _data[LOC_LIFE];// 0, 1, 2 or 3 (none,microbial, flora, fauna)
var settlement = _data[LOC_SETTLEMENT];// yes, no
var attitude = _data[LOC_ATTITUDE];// good, bad (view toward strangers)
//var item_buys = args[7];// item id
//var item_sells = args[8];// item id
var atmosphere = _data[LOC_ATMOSPHERE];// good, medium, poor, unbreathable
var economy = _data[LOC_ECONOMY];

// Terrain descriptions. Centauri is a [dry] world.
var desert=scr_array("a dry","an arid","a sandy","a desert");
var swamp=scr_array("a marshy","a mucky","a boggy","a soggy","a miry","a swampy");
var rocky=scr_array("a mountainous","a rocky","a craggy");
var glacier=scr_array("a glacial","an icy","a frozen","a snow covered");
var ocean=scr_array("an ocean","a wet");
// These terrains require life level 2 or greater. Pick a terrain based on life before submitting to this script
var forest=scr_array("a forest","a forested","a wooded");
var jungle=scr_array("a forest","a forested","a jungle");
var tundra=scr_array("a tundra","a flat","a grassy");
var plains=scr_array("a plains","a flat","a grassy");

var bodyNames;
if(_data[LOC_TYPE]==GX_PLANET){
    bodyNames=scr_array("planet","world");
}else{
    bodyNames=scr_array("moon","place");
}

var terrainWords=noone;
var terrainWords = scr_array(desert,swamp,rocky,glacier,ocean,forest,jungle,tundra,plains);
var terrainsChoices = terrainWords[terrain];
var text="";
var text = name + " is a " + scr_array_random(terrainsChoices) + " " + scr_array_random(bodyNames) + ".";
// Centauri is a rocky world.

// Conditions description
var conditionsGood1 = scr_array("mild","peaceful","pleasant","clement","wild","fair","clear");
var conditionsGood2 = scr_array("good","favorable","benign");
var conditionsBad1 = scr_array("harsh","brutal","unforgiving","rugged","wild","dark","bleak","desolate");
var conditionsBad2 = scr_array("poor","unpleasant","perilous");
var conditionsHotGood = scr_array("lush","fertile","balmy","warm");
var conditionsHotBad = scr_array("searing","hot","scorching");
var conditionsColdGood= scr_array("cool","frosty","refreshing","chilly");
var conditionsColdBad= scr_array("frozen","frigid","biting");

var cd1="";
var cd2="";
var cd3="";
if(condition=="good"){
    cd1 = scr_array_random(conditionsGood1);
    cd2 = scr_array_random(conditionsGood2);
    if(temperature == "hot"){
        cd3 = scr_array_random(conditionsHotGood);
    }else{
        cd3 = scr_array_random(conditionsColdGood);
    }
}else{
    cd1 = scr_array_random(conditionsBad1);
    cd2 = scr_array_random(conditionsBad2);
    if(temperature == "hot"){
        cd3 = scr_array_random(conditionsHotBad);
    }else{
        cd3 = scr_array_random(conditionsColdBad);
    }
}
var cdTxt = choose(
scr_string_ucfirst(cd1) + " and " + cd3 + ", the climate here is " +  cd2 + ".", 
"The conditions here are " + cd3 +", " + cd1 + " and " + cd2 + "."
);


// Life
var life1="";
if(life>0){
    if(condition=="good"){
        if(life>2){
            life1 = choose("Life here flourishes.", "Life on this "+ scr_array_random(bodyNames)+" is abundant.", "Life is everywhere here.");
        }else if(life>1){
            life1 = choose("This world is green with flora, but there are no large animals.","This "+ scr_array_random(bodyNames)+" has a variety of plants, but no animals.");
        }else{
            life1 = choose("Only microbial life has evolved here.","Still, no native life exists above the microscopic level.");
        }
    }else{
        if(life>2){
            life1 = choose("Still, life finds a way. Plants and animals abound here.", "Amazingly, life has evolved and flourished in many various forms.", "Amazingly, plants and animals are common here.");
        }else if(life>1){
            life1 = choose("Remarkably, this world has managed to evolve some plant life.","This "+ scr_array_random(bodyNames)+" has a variety of plants, but no animals.");
        }else{
            life1 = choose("Curiously, some microbial life still clings to existence here.","No native life exists above the microscopic level.");
        }
    }
}else{
    life1=choose("Native life cannot exist here","No life has evolved here.","This world is barren of native life.");
}

var stl1="";
var attd1="";
if(settlement){
    stl1=choose("There is a settlement here.","Some settlers have chosen to make this their home.");
    if(attitude=="good"){
        attd1 = "The residents seem " + choose("warm","friendly","cheerful") + " and " + choose("open","inviting","comfortable") + ".";
    }else if(attitude=="mixed"){
        attd1 = "The residents seem " + choose("friendly","cheerful","warm") + " " + choose("but","if","though") + " " + choose("suspicious","distant","cautious")+ ".";
    }else{
        attd1 = "The residents seem " + choose("grim","distant","cold") + " and " + choose("suspicious","unwelcoming","hostile")+ ".";
    }
    var econ1="";
    if(economy==CC_AGRICULTURE){
        econ1=choose("The economy here is agriculturual.","Most people here farm for a living.","The primary source of livlihood here is the raising of crops and livestock.")
    }else if(economy==CC_MINING){
        econ1=choose("This "+ scr_array_random(bodyNames)+" has a mining economy.","This "+ scr_array_random(bodyNames)+" produces minerals and water through mining operations based on land and in local asteroid fields.");
    }else if(economy==CC_INDUSTRIAL){
        econ1=choose("This "+ scr_array_random(bodyNames)+" has an industrial economy.","Most industry here involves manufacturing and the refining of fuel and chemicals.");
    }else if(economy==CC_TECH){
        econ1=choose("This "+ scr_array_random(bodyNames)+" has a tech economy, producing electronics and medicine.");
    }else{
        econ1="";
    }
    
}else{
    stl1="There is no settlement here.";
}

rslt = scr_array_concat(scr_array(text,cdTxt,life1,stl1,econ1,attd1)," ");

return rslt;


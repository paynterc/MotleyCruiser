/// scr_grievance_to_text(grievance enum index)
var G = argument0;
var txt = '';

switch(G){
    case grievances.money:
        txt = 'MONEY';
        break;
    case grievances.food_quality:
        txt = 'BAD FOOD';
        break;
    case grievances.exhaustion:
        txt = 'EXHAUSTION';
        break;
    case grievances.cleanliness:
        txt = 'MESS';
        break;
    case grievances.loneliness:
        txt = 'LONELY';
        break;
    default:
        txt = 'UNKNOWN GRIEVANCE';
}

return txt;

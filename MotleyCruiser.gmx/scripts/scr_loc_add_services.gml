/// scr_loc_add_services()
var S = scr_array(trade);// Always have trade

var chance=2;
if(irandom(chance)==chance){
    scr_push_array_1d(S,services.ship_repair);
}

var chance=10;
if(irandom(chance)==chance){
    scr_push_array_1d(S,services.ship_sales);
}

var chance=5;
if(irandom(chance)==chance){
    scr_push_array_1d(S,services.band);
}

var chance=4;
if(irandom(chance)==chance){
    scr_push_array_1d(S,services.gambling);
}

var chance=3;
if(irandom(chance)==chance){
    scr_push_array_1d(S,services.loan_shark);
}

var chance=4;
if(irandom(chance)==chance){
    scr_push_array_1d(S,services.black_market);
}

return S;

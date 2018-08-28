// scr_trade_calc_price(item_id)
var item_id = argument0;

var P = 0;// Final price
var B = scr_commodity_lib_read(item_id,4);//base price;
var cc = scr_commodity_lib_read(item_id,1);//commodity class (ag, mining, indust, tech)
var E = e_matrix[econ_id,cc];// Ematrix is set in obj_trade:create. Products from some economies are worth more to other economies.
var O = argument1;// Offsets. A randomizing factor. Maybe not needed.
var L = argument2;
var S = global.sector_economy[cc]*sector_economy_mod;// Local sector supply
var D=0;// Local sector demand
var ESD;// EconomyValue - SectorSupply + SectorDemand
/****
P = max(1,round( B*(E-S+D) ));

Case Example
1) On an Selling a tech item with base price of 100 on an agrarian world. There are 2 tech worlds in the sector and 1 non-tech world.
    P = max(1, round( 100 * max(.10, 1.5 - (2 *.2) + (1 *.2) ))) = 130
****/

// D: Demand is the count of markets that pay a higher price for this good in this sector
for(var i=0;i<array_length_1d(global.sector_economy);i++){
    if(i!=cc){
        D+=global.sector_economy[i];
    }
}
// sector_economy_mod is a fixed value set in obj_trade:create
D *= sector_economy_mod;

ESD = max(.10,E-S+D);


P = max(1,round( B*ESD ));

var m = P * L;
var fm = (item_id-O) * m;
P = round( P + fm );


//P = round( ( B*E*L ) + o );
//P = round( B * E );
return P;

// scr_trade_calc_price(item_id)
var item_id = argument0;

var P = 0;// Final price
var B = scr_inv_item_read(item_id,9);//base price;
var cc = scr_inv_item_read(item_id,8);//commodity class
var E = e_matrix[econ_id,cc];// Landed economy modifier
var o;// Offsets. A randomizing factor. Maybe not needed.
var S = sector_economy[cc]*sector_economy_mod;// Local sector supply
var D=0;// Local sector demand
var ESD;// Economy Supply Demand


for(var i=0;i<array_length_1d(sector_economy);i++){
    if(i!=cc){
        D+=sector_economy[i];
    }
}
D *= sector_economy_mod;

ESD = max(.10,E-S+D);
o = c_offsets[item_id];
P = max(1,round( B*ESD ));

//P = round( ( B*E*L ) + o );
//P = round( B * E );
return P;

/// scr_pool_get(poolId)
// Get the first inactive instance from the pool
// provide an id from enum pool. See obj_pool

var poolId = argument0;
if(!instance_exists(obj_pool)) return noone;
if(poolId>=pool.LENGTH) return noone;
var P = obj_pool.pools[poolId];
var inst = noone;
var instFound = noone;
for(var i=0;i<array_length_1d(P);i++){
    inst = P[i];
    if(!inst.isActive){
        instFound=inst;
        break;
    }
}
if(instFound==noone){
    instFound = instance_create(x,y,obj_pool.poolObjs[poolId]);
    P[@ array_length_1d(P)]=instFound;   
}
instance_activate_object(instFound);
instFound.isActive=true;
return instFound;


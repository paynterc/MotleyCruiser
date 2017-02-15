/// Open da crates
for ( var i = 0; i < instance_number(obj_crate); i += 1 ){
 
    crate = instance_find( obj_crate, i );
    with(crate){
        hp=0;
        event_user(0);
    }

 
}

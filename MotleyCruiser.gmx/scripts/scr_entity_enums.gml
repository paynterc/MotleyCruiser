/// scr_entity_enums()
// Run this at game start and use these enums as array indexes.
// I'm using these in place of macros because the macros were getting to numerous and hard to manage.

// Used to assign a type to the rmm.type value
enum room_types{
    dock,cantina
}

enum rmm{
    w,h,npcs,seed,type,signs,services,objects,walltiles,specialtiles
}

enum rm_sign{
    gridX,gridY,sprIdx
}

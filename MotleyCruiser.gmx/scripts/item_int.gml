global.item_id = ds_map_create();

item_add(0,0,"Oxygen") //Title
item_add(0,1,5) //Max Stack
item_add(0,2,spr_ItemIcon_GasBlue) //Sprite
item_add(0,3,false) //Does have effect?
item_add(0,4,"")  //If yes, put script here on string, if not, just put ""
item_add(0,5,"Compressed gas in a plexisteel bottle.") //Description

item_add(1,0,"Antibiotics")
item_add(1,1,5)
item_add(1,2,spr_ItemIcon_Pills)
item_add(1,3,false)
item_add(1,4,"")
item_add(1,5,"Useful for treating infections")

item_add(2,0,"Flash")
item_add(2,1,500)
item_add(2,2,spr_ItemIcon_PillsSmall)
item_add(2,3,true)
item_add(2,4,"scr_flash")
item_add(2,5,"An invigoration but addictive drug. Speeds up the user's reflexes to the point that it seems to slow down time.")

item_add(3,0,"Lab Equipment")
item_add(3,1,5)
item_add(3,2,spr_ItemIcon_Bottle2)
item_add(3,3,false)
item_add(3,4,"")
item_add(3,5,"Some egghead will appreciate this")

item_add(4,0,"Lubricant")
item_add(4,1,5)
item_add(4,2,spr_ItemIcon_BigDefPotion)
item_add(4,3,false)
item_add(4,4,"")
item_add(4,5,"Keeps everything running smoothly")

item_add(5,0,"Human Blood")
item_add(5,1,5)
item_add(5,2,spr_ItemIcon_BloodRed)
item_add(5,3,false)
item_add(5,4,"")
item_add(5,5,"Valuable to hospitals, medbays and Sanguinists")

item_add(6,0,"Water")
item_add(6,1,5)
item_add(6,2,spr_ItemIcon_Water)
item_add(6,3,false)
item_add(6,4,"")
item_add(6,5,"Almost everybody needs this")

item_add(7,0,"Perfume")
item_add(7,1,5)
item_add(7,2,spr_ItemIcon_LiquidPink)
item_add(7,3,false)
item_add(7,4,"")
item_add(7,5,"For fancy ladies and gentlemen")

item_add(8,0,"Big Mana Potion")
item_add(8,1,5)
item_add(8,2,spr_ItemIcon_BigManaPotion)
item_add(8,3,false)
item_add(8,4,"")
item_add(8,5,"Refill your Mana!")

item_add(9,0,"Medkit m5")
item_add(9,1,200)
item_add(9,2,spr_ItemIcon_medkit)
item_add(9,3,true)
item_add(9,4,"scr_heal_player,5")
item_add(9,5,"Heal Up")

item_add(10,0,"Refined Copper")
item_add(10,1,5)
item_add(10,2,spr_ItemIcon_Copper)
item_add(10,3,false)
item_add(10,4,"")
item_add(10,5,"Refined metal is useful for manufacturing")

item_add(11,0,"Lumber")
item_add(11,1,5)
item_add(11,2,spr_ItemIcon_CutWood)
item_add(11,3,false)
item_add(11,4,"")
item_add(11,5,"Useful to settlers and carpenters")

item_add(12,0,"Diamantium Crystal")
item_add(12,1,5)
item_add(12,2,spr_ItemIcon_Diamant)
item_add(12,3,false)
item_add(12,4,"")
item_add(12,5,"When refined, can power a starship")

item_add(13,0,"Refined Iron")
item_add(13,1,5)
item_add(13,2,spr_ItemIcon_Iron)
item_add(13,3,false)
item_add(13,4,"")
item_add(13,5,"Refined metal is useful for manufacturing")

item_add(14,0,"Tobacco")
item_add(14,1,5)
item_add(14,2,spr_ItemIcon_Leaf)
item_add(14,3,false)
item_add(14,4,"")
item_add(14,5,"Some folks actually smoke this stuff")

item_add(15,0,"Leather")
item_add(15,1,5)
item_add(15,2,spr_ItemIcon_Leather)
item_add(15,3,false)
item_add(15,4,"")
item_add(15,5,"Makes durable clothing")

item_add(16,0,"Meat")
item_add(16,1,5)
item_add(16,2,spr_ItemIcon_Meat)
item_add(16,3,false)
item_add(16,4,"")
item_add(16,5,"Who's hungry?")

item_add(17,0,"Diamonds")
item_add(17,1,5)
item_add(17,2,spr_ItemIcon_Diamonds)
item_add(17,3,false)
item_add(17,4,"")
item_add(17,5,"Sparkly!")

item_add(18,0,"Cooked Meat")
item_add(18,1,5)
item_add(18,2,spr_ItemIcon_MeatCooked)
item_add(18,3,false)
item_add(18,4,"")
item_add(18,5,"Restore your stomach")

item_add(19,0,"Raw Wood")
item_add(19,1,5)
item_add(19,2,spr_ItemIcon_RawWood)
item_add(19,3,false)
item_add(19,4,"")
item_add(19,5,"A raw wood, very useful")

item_add(20,0,"Cutten Wood")
item_add(20,1,5)
item_add(20,2,spr_ItemIcon_CutWood)
item_add(20,3,false)
item_add(20,4,"")
item_add(20,5,"A cut wood for crafting")

item_add(21,0,"Sticky")
item_add(21,1,5)
item_add(21,2,spr_ItemIcon_Sticky)
item_add(21,3,false)
item_add(21,4,"")
item_add(21,5,"A Sticky for crafting")

item_add(22,0,"Stone Ore")
item_add(22,1,5)
item_add(22,2,spr_ItemIcon_OreStone)
item_add(22,3,false)
item_add(22,4,"")
item_add(22,5,"Must be melted")

item_add(23,0,"Copper Ore")
item_add(23,1,5)
item_add(23,2,spr_ItemIcon_OreCopper)
item_add(23,3,false)
item_add(23,4,"")
item_add(23,5,"Must be melted")

item_add(24,0,"Iron Ore")
item_add(24,1,5)
item_add(24,2,spr_ItemIcon_OreIron)
item_add(24,3,false)
item_add(24,4,"")
item_add(24,5,"Must be melted")

item_add(25,0,"Gold Ore")
item_add(25,1,5)
item_add(25,2,spr_ItemIcon_OreGold)
item_add(25,3,false)
item_add(25,4,"")
item_add(25,5,"Must be melted")

item_add(26,0,"Diamant Ore")
item_add(26,1,5)
item_add(26,2,spr_ItemIcon_OreDiamant)
item_add(26,3,false)
item_add(26,4,"")
item_add(26,5,"Must be melted")

item_add(27,0,"Stone Ingot")
item_add(27,1,5)
item_add(27,2,spr_ItemIcon_Stone)
item_add(27,3,false)
item_add(27,4,"")
item_add(27,5,"useful for hard things")

item_add(28,0,"Copper Ingot")
item_add(28,1,5)
item_add(28,2,spr_ItemIcon_Copper)
item_add(28,3,false)
item_add(28,4,"")
item_add(28,5,"A copper ingot")

item_add(29,0,"Gold Ingot")
item_add(29,1,5)
item_add(29,2,spr_ItemIcon_Gold)
item_add(29,3,false)
item_add(29,4,"")
item_add(29,5,"A gold Ingot")

item_add(30,0,"Diamond")
item_add(30,1,5)
item_add(30,2,spr_ItemIcon_Diamant)
item_add(30,3,false)
item_add(30,4,"")
item_add(30,5,"A Diamant")

item_add(31,0,"Sand Ore")
item_add(31,1,5)
item_add(31,2,spr_ItemIcon_OreSand)
item_add(31,3,false)
item_add(31,4,"")
item_add(31,5,"Must be melted")

item_add(32,0,"Sand")
item_add(32,1,5)
item_add(32,2,spr_ItemIcon_Sand)
item_add(32,3,false)
item_add(32,4,"")
item_add(32,5,"useful to melt glas")

item_add(33,0,"Glass")
item_add(33,1,5)
item_add(33,2,spr_ItemIcon_Glas)
item_add(33,3,false)
item_add(33,4,"")
item_add(33,5,"A glass")

item_add(34,0,"Leaf")
item_add(34,1,5)
item_add(34,2,spr_ItemIcon_Leaf)
item_add(34,3,true)
item_add(34,4,"")
item_add(34,5,"A beautiful Leaf")

item_add(35,0,"Coal")
item_add(35,1,5)
item_add(35,2,spr_ItemIcon_Coal)
item_add(35,3,false)
item_add(35,4,"")
item_add(35,5,"useful for furnace")

item_add(36,0,"Leather")
item_add(36,1,5)
item_add(36,2,spr_ItemIcon_Leather)
item_add(36,3,false)
item_add(36,4,"")
item_add(36,5,"A Leather")

item_add(37,0,"Tuluck Bone")
item_add(37,1,5)
item_add(37,2,spr_ItemIcon_Bone)
item_add(37,3,false)
item_add(37,4,"")
item_add(37,5,"Bones of the endangered Vaakrisil Tuluck. Thought by some uninformed Selgesh to bring good luck.")

item_add(38,0,"Raw Beef")
item_add(38,1,5)
item_add(38,2,spr_ItemIcon_LegMeat)
item_add(38,3,false)
item_add(38,4,"")
item_add(38,5,"Butchered meat.")

item_add(39,0,"Dried Beef")
item_add(39,1,10)
item_add(39,2,spr_ItemIcon_LegMeat)
item_add(39,3,false)
item_add(39,4,"")
item_add(39,5,"Dried meat will keep longer and weighs less than fresh meat. Good for extended trips.")

item_add(40,0,"Crypto Unicorn Horn")
item_add(40,1,5)
item_add(40,2,spr_ItemIcon_Claw)
item_add(40,3,false)
item_add(40,4,"")
item_add(40,5,"Horn of the endangered Crypto Unicorn. Thought by some to be an aphrodisiac.")

item_add(41,0,"Hozone Warp Turkey Feather")
item_add(41,1,5)
item_add(41,2,spr_ItemIcon_Feather)
item_add(41,3,false)
item_add(41,4,"")
item_add(41,5,"An attractive feather. Popular in fashionable circles.")

item_add(42,0,"Medkit m10")
item_add(42,1,10)
item_add(42,2,spr_ItemIcon_medkit)
item_add(42,3,true)
item_add(42,4,"scr_heal_player,10")
item_add(42,5,"Heal up")

item_add(43,0,"Water Bucket")
item_add(43,1,5)
item_add(43,2,spr_ItemIcon_WaterBucket)
item_add(43,3,false)
item_add(43,4,"")
item_add(43,5,"A water bucket")

item_add(44,0,"Empty Iron Bucket")
item_add(44,1,5)
item_add(44,2,spr_ItemIcon_WaterBucket)
item_add(44,3,false)
item_add(44,4,"")
item_add(44,5,"to refill any of these hot")

item_add(45,0,"Lava Iron Bucket")
item_add(45,1,5)
item_add(45,2,spr_ItemIcon_WaterBucket)
item_add(45,3,false)
item_add(45,4,"")
item_add(45,5,"A lava iron bucket")

item_add(46,0,"Oil")
item_add(46,1,5)
item_add(46,2,spr_ItemIcon_Oil)
item_add(46,3,false)
item_add(46,4,"")
item_add(46,5,"Useful for furnace")

item_add(47,0,"Toxic Waste")
item_add(47,1,5)
item_add(47,2,spr_ItemIcon_Slime)
item_add(47,3,false)
item_add(47,4,"")
item_add(47,5,"Somebody needs to get rid of this")

item_add(48,0,"Crystal Gold Stone")
item_add(48,1,5)
item_add(48,2,spr_ItemIcon_CrystalGoldStone)
item_add(48,3,false)
item_add(48,4,"")
item_add(48,5,"a rare stone from golem")

item_add(49,0,"Crystal Gold Stone")
item_add(49,1,5)
item_add(49,2,spr_ItemIcon_CrystalGoldStone)
item_add(49,3,false)
item_add(49,4,"")
item_add(49,5,"a rare stone from golem")

item_add(50,0,"Soul Dust")
item_add(50,1,5)
item_add(50,2,spr_ItemIcon_SoulDust)
item_add(50,3,false)
item_add(50,4,"")
item_add(50,5,"A highly addictive drug.")

item_add(51,0,"Blaster Rifle A") //Title
item_add(51,1,10) //Max Stack
item_add(51,2,spr_rifle1) //Sprite
item_add(51,3,true) //Does have effect?
item_add(51,4,"scr_equip_weapon,51")  //If yes, put script here on string, if not, just put ""
item_add(51,5,"Your basic space gun") //Description
item_add(51,6,obj_blaster1) //Object to equip

item_add(52,0,"Crate Master Card")
item_add(52,1,10)
item_add(52,2,spr_keycard)
item_add(52,3,true)
item_add(52,4,"scr_break_crates")
item_add(52,5,"Bust the crates!")

item_add(53,0,"Sticky Grenade")
item_add(53,1,10)
item_add(53,2,spr_ItemIcon_Grenade)
item_add(53,3,false)
item_add(53,4,"")
item_add(53,5,"A powerful bomb. Amazingly, still safe to use on spaceships.")

item_add(54,0,"Flamethrower A1") //Title
item_add(54,1,10) //Max Stack
item_add(54,2,spr_flamer1) //Sprite
item_add(54,3,true) //Does have effect?
item_add(54,4,"scr_equip_weapon,54")  //If yes, put script here on string, if not, just put ""
item_add(54,5,"An advanced flamethrower") //Description
item_add(54,6,obj_flamethrower1) //Object to equip

item_add(55,0,"Warp Sword") //Title
item_add(55,1,10) //Max Stack
item_add(55,2,spr_laser_sword) //Sprite
item_add(55,3,true) //Does have effect?
item_add(55,4,"scr_equip_weapon,55")  //If yes, put script here on string, if not, just put ""
item_add(55,5,"A mysterious weapon of unknown origin.") //Description
item_add(55,6,obj_warp_sword) //Object to equip

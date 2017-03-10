global.item_id = ds_map_create();

var idx=0;
item_add(0,0,"Oxygen") //Title
item_add(0,1,5) //Max Stack
item_add(0,2,spr_ItemIcon_GasBlue) //Sprite
item_add(0,3,false) //Does have effect?
item_add(0,4,"")  //If yes, put script here on string, if not, just put ""
item_add(0,5,"Compressed gas in a plexisteel bottle.") //Description
item_add(0,7,"commodity") //Commodity or equipment
item_add(0,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,10) //Base price

idx=1;
item_add(1,0,"Antibiotics")
item_add(1,1,5)
item_add(1,2,spr_ItemIcon_Pills)
item_add(1,3,false)
item_add(1,4,"")
item_add(1,5,"Useful for treating infections")
item_add(1,7,"commodity") //Commodity or equipment
item_add(1,8,CC_TECH) //CC_MINING (Commodity Class Mining),
item_add(idx,9,50) //Base price

idx=2;
item_add(2,0,"Flash")
item_add(2,1,500)
item_add(2,2,spr_ItemIcon_PillsSmall)
item_add(2,3,true)
item_add(2,4,"scr_flash")
item_add(2,5,"An invigoration but addictive drug. Speeds up the user's reflexes to the point that it seems to slow down time.")
item_add(2,7,"commodity") //Commodity or equipment
item_add(2,8,CC_TECH) //CC_MINING (Commodity Class Mining),
item_add(idx,9,90) //Base price

idx=3;
item_add(3,0,"Lab Equipment")
item_add(3,1,5)
item_add(3,2,spr_ItemIcon_Bottle2)
item_add(3,3,false)
item_add(3,4,"")
item_add(3,5,"Some egghead will appreciate this")
item_add(3,7,"commodity") //Commodity or equipment
item_add(3,8,CC_TECH) //CC_MINING (Commodity Class Mining),
item_add(idx,9,100) //Base price

idx=4;
item_add(4,0,"Lubricant")
item_add(4,1,5)
item_add(4,2,spr_ItemIcon_BigDefPotion)
item_add(4,3,false)
item_add(4,4,"")
item_add(4,5,"Keeps everything running smoothly")
item_add(4,7,"commodity") //Commodity or equipment
item_add(4,8,CC_INDUSTRIAL) //CC_MINING (Commodity Class Mining),
item_add(idx,9,30) //Base price

idx=5;
item_add(5,0,"Human Blood")
item_add(5,1,5)
item_add(5,2,spr_ItemIcon_BloodRed)
item_add(5,3,false)
item_add(5,4,"")
item_add(5,5,"Valuable to hospitals, medbays and Sanguinists")
item_add(5,7,"commodity") //Commodity or equipment
item_add(5,8,CC_TECH) //CC_MINING (Commodity Class Mining),
item_add(idx,9,80) //Base price

idx=6;
item_add(6,0,"Water")
item_add(6,1,5)
item_add(6,2,spr_ItemIcon_Water)
item_add(6,3,false)
item_add(6,4,"")
item_add(6,5,"Almost everybody needs this")
item_add(6,7,"commodity") //Commodity or equipment
item_add(6,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,15) //Base price

idx=7;
item_add(7,0,"Perfume")
item_add(7,1,5)
item_add(7,2,spr_ItemIcon_LiquidPink)
item_add(7,3,false)
item_add(7,4,"")
item_add(7,5,"For fancy ladies and gentlemen")
item_add(7,7,"commodity") //Commodity or equipment
item_add(7,8,CC_TECH) //CC_MINING (Commodity Class Mining),
item_add(idx,9,100) //Base price

idx=8;
item_add(8,0,"Szzozz Cola")
item_add(8,1,5)
item_add(8,2,spr_ItemIcon_BigManaPotion)
item_add(8,3,false)
item_add(8,4,"")
item_add(8,5,"Refill your Mana!")
item_add(idx,9,10) //Base price

idx=9;
item_add(9,0,"Medkit m5")
item_add(9,1,200)
item_add(9,2,spr_ItemIcon_medkit)
item_add(9,3,true)
item_add(9,4,"scr_heal_player,5")
item_add(9,5,"Heal Up")

idx=10;
item_add(10,0,"Refined Copper")
item_add(10,1,5)
item_add(10,2,spr_ItemIcon_Copper)
item_add(10,3,false)
item_add(10,4,"")
item_add(10,5,"Refined metal is useful for manufacturing")
item_add(10,7,"commodity") //Commodity or equipment
item_add(10,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,20) //Base price

idx=11;
item_add(11,0,"Lumber")
item_add(11,1,5)
item_add(11,2,spr_ItemIcon_CutWood)
item_add(11,3,false)
item_add(11,4,"")
item_add(11,5,"Useful to settlers and carpenters")
item_add(11,7,"commodity") //Commodity or equipment
item_add(11,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,10) //Base price

idx=12;
item_add(12,0,"Diamantium Crystal")
item_add(12,1,5)
item_add(12,2,spr_ItemIcon_Diamant)
item_add(12,3,false)
item_add(12,4,"")
item_add(12,5,"When refined, can power a starship")
item_add(12,7,"commodity") //Commodity or equipment
item_add(12,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,40) //Base price

idx=13;
item_add(13,0,"Refined Iron")
item_add(13,1,5)
item_add(13,2,spr_ItemIcon_Iron)
item_add(13,3,false)
item_add(13,4,"")
item_add(13,5,"Refined metal is useful for manufacturing")
item_add(13,7,"commodity") //Commodity or equipment
item_add(13,8,CC_INDUSTRIAL) //CC_MINING (Commodity Class Mining),
item_add(idx,9,20) //Base price

idx=14;
item_add(14,0,"Tobacco")
item_add(14,1,5)
item_add(14,2,spr_ItemIcon_Leaf)
item_add(14,3,false)
item_add(14,4,"")
item_add(14,5,"Some folks actually smoke this stuff")
item_add(14,7,"commodity") //Commodity or equipment
item_add(14,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,10) //Base price

idx=15;
item_add(15,0,"Leather")
item_add(15,1,5)
item_add(15,2,spr_ItemIcon_Leather)
item_add(15,3,false)
item_add(15,4,"")
item_add(15,5,"Makes durable clothing")
item_add(15,7,"commodity") //Commodity or equipment
item_add(15,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,20) //Base price

idx=16;
item_add(16,0,"Meat")
item_add(16,1,5)
item_add(16,2,spr_ItemIcon_Meat)
item_add(16,3,false)
item_add(16,4,"")
item_add(16,5,"Who's hungry?")
item_add(16,7,"commodity") //Commodity or equipment
item_add(16,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,5) //Base price

idx=17;
item_add(17,0,"Diamonds")
item_add(17,1,5)
item_add(17,2,spr_ItemIcon_Diamonds)
item_add(17,3,false)
item_add(17,4,"")
item_add(17,5,"Sparkly!")
item_add(17,7,"commodity") //Commodity or equipment
item_add(17,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,90) //Base price

idx=18;
item_add(18,0,"Dried Beef")
item_add(18,1,5)
item_add(18,2,spr_ItemIcon_MeatCooked)
item_add(18,3,false)
item_add(18,4,"")
item_add(18,5,"Dried meat will keep longer and weighs less than fresh meat. Good for extended trips.")
item_add(18,7,"commodity") //Commodity or equipment
item_add(18,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,20) //Base price

idx=19;
item_add(19,0,"Raw Wood")
item_add(19,1,5)
item_add(19,2,spr_ItemIcon_RawWood)
item_add(19,3,false)
item_add(19,4,"")
item_add(19,5,"A raw wood, very useful")
item_add(19,7,"commodity") //Commodity or equipment
item_add(19,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,5) //Base price

idx=20;
item_add(20,0,"Raw Cotten")
item_add(20,1,5)
item_add(20,2,spr_ItemIcon_CutWood)
item_add(20,3,false)
item_add(20,4,"")
item_add(20,5,"Raw material for textiles")
item_add(20,7,"commodity") //Commodity or equipment
item_add(20,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining)
item_add(idx,9,5) //Base price


idx=21;
item_add(21,0,"Raw Wool")
item_add(21,1,5)
item_add(21,2,spr_ItemIcon_Sticky)
item_add(21,3,false)
item_add(21,4,"")
item_add(21,5,"Raw material for textile")
item_add(21,7,"commodity") //Commodity or equipment
item_add(21,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,5) //Base price

idx=22;
item_add(22,0,"Uranium Ore")
item_add(22,1,5)
item_add(22,2,spr_ItemIcon_OreStone)
item_add(22,3,false)
item_add(22,4,"")
item_add(22,5,"Must be melted")
item_add(22,7,"commodity") //Commodity or equipment
item_add(22,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,30) //Base price

idx=23;
item_add(23,0,"Copper Ore")
item_add(23,1,5)
item_add(23,2,spr_ItemIcon_OreCopper)
item_add(23,3,false)
item_add(23,4,"")
item_add(23,5,"Must be melted")
item_add(23,7,"commodity") //Commodity or equipment
item_add(23,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,10) //Base price

idx=24;
item_add(24,0,"Iron Ore")
item_add(24,1,5)
item_add(24,2,spr_ItemIcon_OreIron)
item_add(24,3,false)
item_add(24,4,"")
item_add(24,5,"Must be melted")
item_add(24,7,"commodity") //Commodity or equipment
item_add(24,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,10) //Base price

idx=25;
item_add(25,0,"Gold Ore")
item_add(25,1,5)
item_add(25,2,spr_ItemIcon_OreGold)
item_add(25,3,false)
item_add(25,4,"")
item_add(25,5,"Must be melted")
item_add(25,7,"commodity") //Commodity or equipment
item_add(25,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,20) //Base price

idx=26;
item_add(26,0,"Diamantium Ore")
item_add(26,1,5)
item_add(26,2,spr_ItemIcon_OreDiamant)
item_add(26,3,false)
item_add(26,4,"")
item_add(26,5,"Must be melted")
item_add(26,7,"commodity") //Commodity or equipment
item_add(26,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,40) //Base price

idx=27;
item_add(27,0,"Refined Uranium")
item_add(27,1,5)
item_add(27,2,spr_ItemIcon_Stone)
item_add(27,3,false)
item_add(27,4,"")
item_add(27,5,"useful for hard things")
item_add(27,7,"commodity") //Commodity or equipment
item_add(27,8,CC_INDUSTRIAL) //CC_MINING (Commodity Class Mining),
item_add(idx,9,40) //Base price

idx=28;
item_add(28,0,"Refined Copper")
item_add(28,1,5)
item_add(28,2,spr_ItemIcon_Copper)
item_add(28,3,false)
item_add(28,4,"")
item_add(28,5,"A copper ingot")
item_add(28,7,"commodity") //Commodity or equipment
item_add(28,8,CC_INDUSTRIAL) //CC_MINING (Commodity Class Mining),
item_add(idx,9,20) //Base price

idx=29;
item_add(29,0,"Refined Gold")
item_add(29,1,5)
item_add(29,2,spr_ItemIcon_Gold)
item_add(29,3,false)
item_add(29,4,"")
item_add(29,5,"A gold Ingot")
item_add(29,7,"commodity") //Commodity or equipment
item_add(29,8,CC_INDUSTRIAL) //CC_MINING (Commodity Class Mining),
item_add(idx,9,30) //Base price

idx=30;
item_add(30,0,"Diamond")
item_add(30,1,5)
item_add(30,2,spr_ItemIcon_Diamant)
item_add(30,3,false)
item_add(30,4,"")
item_add(30,5,"Extremely hard and valuable.")
item_add(30,7,"commodity") //Commodity or equipment
item_add(30,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,90) //Base price

idx=31;
item_add(31,0,"Nickel Ore")
item_add(31,1,5)
item_add(31,2,spr_ItemIcon_OreSand)
item_add(31,3,false)
item_add(31,4,"")
item_add(31,5,"Must be melted")
item_add(31,7,"commodity") //Commodity or equipment
item_add(31,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,15) //Base price

idx=32;
item_add(32,0,"Refined Nickel")
item_add(32,1,5)
item_add(32,2,spr_ItemIcon_Sand)
item_add(32,3,false)
item_add(32,4,"")
item_add(32,5,"A useful metal.")
item_add(32,7,"commodity") //Commodity or equipment
item_add(32,8,CC_INDUSTRIAL) //CC_MINING (Commodity Class Mining),
item_add(idx,9,25) //Base price

idx=33;
item_add(33,0,"Sealant")
item_add(33,1,5)
item_add(33,2,spr_ItemIcon_Glas)
item_add(33,3,false)
item_add(33,4,"")
item_add(33,5,"Good for plugging holes")
item_add(33,7,"commodity") //Commodity or equipment
item_add(33,8,CC_INDUSTRIAL) //CC_MINING (Commodity Class Mining),
item_add(idx,9,5) //Base price

idx=34;
item_add(34,0,"Fresh greens")
item_add(34,1,5)
item_add(34,2,spr_ItemIcon_Leaf)
item_add(34,3,true)
item_add(34,4,"")
item_add(34,5,"Chock full of vitamins")
item_add(34,7,"commodity") //Commodity or equipment
item_add(34,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,20) //Base price

idx=35;
item_add(35,0,"Coal")
item_add(35,1,5)
item_add(35,2,spr_ItemIcon_Coal)
item_add(35,3,false)
item_add(35,4,"")
item_add(35,5,"useful for furnace")
item_add(35,7,"commodity") //Commodity or equipment
item_add(35,8,CC_MINING) //CC_MINING (Commodity Class Mining),
item_add(idx,9,5) //Base price

idx=36;
item_add(36,0,"Leather")
item_add(36,1,5)
item_add(36,2,spr_ItemIcon_Leather)
item_add(36,3,false)
item_add(36,4,"")
item_add(36,5,"A Leather")
item_add(36,7,"commodity") //Commodity or equipment
item_add(36,8,CC_INDUSTRIAL) //CC_MINING (Commodity Class Mining),
item_add(idx,9,20) //Base price

idx=37;
item_add(37,0,"Tuluck Bone")
item_add(37,1,5)
item_add(37,2,spr_ItemIcon_Bone)
item_add(37,3,false)
item_add(37,4,"")
item_add(37,5,"Bones of the endangered Vaakrisil Tuluck. Thought by the uninformed to bring good luck.")
item_add(37,7,"commodity") //Commodity or equipment
item_add(37,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,10) //Base price

idx=38;
item_add(38,0,"Raw Beef")
item_add(38,1,5)
item_add(38,2,spr_ItemIcon_LegMeat)
item_add(38,3,false)
item_add(38,4,"")
item_add(38,5,"Butchered meat.")
item_add(38,7,"commodity") //Commodity or equipment
item_add(38,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,5) //Base price

idx=39;
item_add(39,0,"Dried Turkey")
item_add(39,1,10)
item_add(39,2,spr_ItemIcon_LegMeat)
item_add(39,3,false)
item_add(39,4,"")
item_add(39,5,"Dried meat will keep longer and weighs less than fresh meat. Good for extended trips.")
item_add(39,7,"commodity") //Commodity or equipment
item_add(39,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,10) //Base price

idx=40;
item_add(40,0,"Crypto Unicorn Horn")
item_add(40,1,5)
item_add(40,2,spr_ItemIcon_Claw)
item_add(40,3,false)
item_add(40,4,"")
item_add(40,5,"Horn of the endangered Crypto Unicorn. Thought by some to be an aphrodisiac.")
item_add(40,7,"commodity") //Commodity or equipment
item_add(40,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,50) //Base price

idx=41;
item_add(41,0,"Hozone Warp Turkey Feather")
item_add(41,1,5)
item_add(41,2,spr_ItemIcon_Feather)
item_add(41,3,false)
item_add(41,4,"")
item_add(41,5,"An attractive feather. Popular in fashionable circles.")
item_add(41,7,"commodity") //Commodity or equipment
item_add(41,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,50) //Base price

idx=42;
item_add(42,0,"Medkit m10")
item_add(42,1,10)
item_add(42,2,spr_ItemIcon_medkit)
item_add(42,3,true)
item_add(42,4,"scr_heal_player,10")
item_add(42,5,"Heal up")

idx=43;
item_add(43,0,"Beer")
item_add(43,1,5)
item_add(43,2,spr_ItemIcon_BeerBucket)
item_add(43,3,false)
item_add(43,4,"")
item_add(43,5,"A refreshing and relaxing drink.")
item_add(43,7,"commodity") //Commodity or equipment
item_add(43,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,10) //Base price

idx=44;
item_add(44,0,"Fresh Apples")
item_add(44,1,5)
item_add(44,2,spr_ItemIcon_Fruit)
item_add(44,3,false)
item_add(44,4,"")
item_add(44,5,"Fresh produce is hard to come by in space.")
item_add(44,7,"commodity") //Commodity or equipment
item_add(44,8,CC_AGRICULTURE) //CC_MINING (Commodity Class Mining),
item_add(idx,9,5) //Base price

idx=45;
item_add(45,0,"Industrial Equipment")
item_add(45,1,5)
item_add(45,2,spr_ItemIcon_WaterBucket)
item_add(45,3,false)
item_add(45,4,"")
item_add(45,5,"A lava iron bucket")
item_add(45,7,"commodity") //Commodity or equipment
item_add(45,8,CC_TECH) //CC_MINING (Commodity Class Mining),
item_add(idx,9,50) //Base price

idx=46;
item_add(46,0,"Oil")
item_add(46,1,5)
item_add(46,2,spr_ItemIcon_Oil)
item_add(46,3,false)
item_add(46,4,"")
item_add(46,5,"Useful for furnace")
item_add(46,7,"commodity") //Commodity or equipment
item_add(46,8,CC_INDUSTRIAL) //CC_MINING (Commodity Class Mining),
item_add(idx,9,10) //Base price

idx=47;
item_add(47,0,"Toxic Waste")
item_add(47,1,5)
item_add(47,2,spr_ItemIcon_Slime)
item_add(47,3,false)
item_add(47,4,"")
item_add(47,5,"Somebody needs to get rid of this")

idx=48;
item_add(48,0,"Crystal Gold Stone")
item_add(48,1,5)
item_add(48,2,spr_ItemIcon_CrystalGoldStone)
item_add(48,3,false)
item_add(48,4,"")
item_add(48,5,"a rare stone from golem")

idx=49;
item_add(49,0,"Crystal Gold Stone")
item_add(49,1,5)
item_add(49,2,spr_ItemIcon_CrystalGoldStone)
item_add(49,3,false)
item_add(49,4,"")
item_add(49,5,"a rare stone from golem")

idx=50;
item_add(50,0,"Soul Dust")
item_add(50,1,5)
item_add(50,2,spr_ItemIcon_SoulDust)
item_add(50,3,false)
item_add(50,4,"")
item_add(50,5,"A highly addictive drug.")
item_add(50,7,"commodity") //Commodity or equipment
item_add(50,8,CC_TECH) //CC_MINING (Commodity Class Mining),
item_add(idx,9,50) //Base price

idx=51;
item_add(51,0,"Blaster Type 1") //Title
item_add(51,1,10) //Max Stack
item_add(51,2,spr_rifle1) //Sprite
item_add(51,3,true) //Does have effect?
item_add(51,4,"scr_equip_weapon,51")  //If yes, put script here on string, if not, just put ""
item_add(51,5,"Your basic space gun") //Description
item_add(51,6,obj_blaster1) //Object to equip

idx=52;
item_add(52,0,"Crate Master Card")
item_add(52,1,10)
item_add(52,2,spr_keycard)
item_add(52,3,true)
item_add(52,4,"scr_break_crates")
item_add(52,5,"Bust the crates!")

idx=53;
item_add(53,0,"Sticky Grenade")
item_add(53,1,10)
item_add(53,2,spr_ItemIcon_Grenade)
item_add(53,3,false)
item_add(53,4,"")
item_add(53,5,"A powerful bomb. Amazingly, still safe to use on spaceships.")

idx=54;
item_add(54,0,"Flamethrower A1") //Title
item_add(54,1,10) //Max Stack
item_add(54,2,spr_flamer1) //Sprite
item_add(54,3,true) //Does have effect?
item_add(54,4,"scr_equip_weapon,54")  //If yes, put script here on string, if not, just put ""
item_add(54,5,"An advanced flamethrower") //Description
item_add(54,6,obj_flamethrower1) //Object to equip

idx=55;
item_add(55,0,"Warp Sword") //Title
item_add(55,1,10) //Max Stack
item_add(55,2,spr_laser_sword) //Sprite
item_add(55,3,true) //Does have effect?
item_add(55,4,"scr_equip_weapon,55")  //If yes, put script here on string, if not, just put ""
item_add(55,5,"A mysterious weapon of unknown origin.") //Description
item_add(55,6,obj_warp_sword) //Object to equip

idx=56;
item_add(56,0,"Heavy Blaster Type 1") //Title
item_add(56,1,10) //Max Stack
item_add(56,2,spr_rifle2) //Sprite
item_add(56,3,true) //Does have effect?
item_add(56,4,"scr_equip_weapon,56")  //If yes, put script here on string, if not, just put ""
item_add(56,5,"Larger and heavier than a standard hand blaster.") //Description
item_add(56,6,obj_heavy_blaster1) //Object to equip

idx=57;
item_add(57,0,"Singularity Cannon") //Title
item_add(57,1,10) //Max Stack
item_add(57,2,spr_singularity_gun) //Sprite
item_add(57,3,true) //Does have effect?
item_add(57,4,"scr_equip_weapon,57")  //If yes, put script here on string, if not, just put ""
item_add(57,5,"Fires a miniature black hole. Slow moving but unstoppable, the singularity will suck up all projectiles it comes in contact with.") //Description
item_add(57,6,obj_singularity_gun) //Object to equip

global.item_lib_count = idx+1;

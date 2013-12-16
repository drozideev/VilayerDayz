//Created by TheSzerdi edited by MimiC
_crate = _this select 0;

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

// CONSTRUCTION MATERIALS
_crate addMagazineCargoGlobal ["CinderBlocks", 15];
_crate addMagazineCargoGlobal ["MortarBucket", 15];
_crate addMagazineCargoGlobal ["PartPlywoodPack", 10];
_crate addMagazineCargoGlobal ["PartLumberPack", 10];
_crate addMagazineCargoGlobal ["ItemCanvas", 10];
_crate addMagazineCargoGlobal ["PartGeneric", 24];
_crate addMagazineCargoGlobal ["ItemSandbag", 12];
_crate addMagazineCargoGlobal ["ItemTankTrap", 12];
_crate addMagazineCargoGlobal ["PartWoodPile", 20];

// TOOLS
_crate addWeaponCargoGlobal ["ItemToolbox", 2];
_crate addWeaponCargoGlobal ["ItemEtool", 2];
_crate addWeaponCargoGlobal ["ItemCrowbar", 2];
_crate addWeaponCargoGlobal ["ItemKnife", 2];
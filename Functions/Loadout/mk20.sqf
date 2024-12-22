if (!local player) exitWith {};
comment "Remove existing items";
removeAllWeapons player;
comment "Add weapons";
player addWeapon "arifle_Mk20_F";
player addPrimaryWeaponItem "muzzle_snds_M";
player addPrimaryWeaponItem "optic_Arco_blk_F";
player addPrimaryWeaponItem "30Rnd_556x45_Stanag";
for "_i"
from 1 to 20 do {
    player addItemToVest "30Rnd_556x45_Stanag";
};
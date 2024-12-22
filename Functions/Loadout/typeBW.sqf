if (!local player) exitWith {};
comment "Remove existing items";
removeAllWeapons player;
comment "Add weapons";
player addWeapon "arifle_ARX_blk_F";
player addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
player addPrimaryWeaponItem "optic_Arco_blk_F";
player addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
for "_i"
from 1 to 10 do {
    player addItemToVest "30Rnd_65x39_caseless_green";
};
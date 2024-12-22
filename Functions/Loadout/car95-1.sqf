if (!local player) exitWith {};
comment "Remove existing items";
removeAllWeapons player;
comment "Add weapons";
player addWeapon "arifle_CTARS_blk_F";
player addPrimaryWeaponItem "muzzle_snds_58_blk_F";
player addPrimaryWeaponItem "optic_Arco_blk_F";
player addPrimaryWeaponItem "100Rnd_580x42_Mag_F";
for "_i"
from 1 to 8 do {
    player addItemToVest "100Rnd_580x42_Mag_F";
};
if (!local player) exitWith {};
comment "Remove existing items";
removeAllWeapons player;
comment "Add weapons";
player addWeapon "arifle_SPAR_02_blk_F";
player addPrimaryWeaponItem "muzzle_snds_M";
player addPrimaryWeaponItem "optic_Arco_blk_F";
player addPrimaryWeaponItem "150Rnd_556x45_Drum_Mag_F";
comment "Add items to containers";
for "_i"
from 1 to 7 do {
    player addItemToVest "150Rnd_556x45_Drum_Mag_F";
};
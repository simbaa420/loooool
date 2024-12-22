if (!local player) exitWith {};
comment "Remove existing items";
removeAllWeapons player;
comment "Add weapons";
player addWeapon "arifle_MX_SW_Black_F";
player addPrimaryWeaponItem "muzzle_snds_H";
player addPrimaryWeaponItem "optic_Arco_blk_F";
player addPrimaryWeaponItem "100Rnd_65x39_caseless_black_mag";
for "_i"
from 1 to 10 do {
    player addItemToVest "100Rnd_65x39_caseless_black_mag";
};
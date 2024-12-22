if (!local player) exitWith {};
comment "Remove existing items";
removeAllWeapons player;
comment "Add weapons";
player addWeapon "srifle_DMR_03_F";
player addPrimaryWeaponItem "optic_Arco_blk_F";
player addPrimaryWeaponItem "20Rnd_762x51_Mag";
for "_i"
from 1 to 15 do {
    player addItemToVest "20Rnd_762x51_Mag";
};
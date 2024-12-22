currentMoney = profileNamespace getVariable["Money", 0];
if (currentMoney >= 30000) then {
    call Vortex_fnc_saveGear;
    player setVariable["SpecialGear", true];
    if !(primaryWeapon player isEqualTo "B_Patrol_Soldier_MachineGunner_weapon_F") then {
        removeAllWeapons player;
        player addWeapon "B_Patrol_Soldier_MachineGunner_weapon_F";
        player addPrimaryWeaponItem "acc_flashlight";
        player addPrimaryWeaponItem "optic_Arco_blk_F";
        player addPrimaryWeaponItem "200Rnd_65x39_cased_Box";
        player addPrimaryWeaponItem "bipod_01_F_blk";
    };
    WeaponPrice = 30000;
    newMoneyAmount = currentMoney - WeaponPrice;
    profileNamespace setVariable["Money", newMoneyAmount];
    ["You have purchased the weapon for 30.000$!", "success"] call Vortex_fnc_notification_system;
} else {
    ["You don't have enough money to buy this!", "error"] call Vortex_fnc_notification_system;
    call Vortex_fnc_loadGear;
    player setVariable["SpecialGear", false];
};
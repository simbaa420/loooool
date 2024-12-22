currentMoney = profileNamespace getVariable["Money", 0];
if (currentMoney >= 150000) then {
    call Vortex_fnc_saveGear;
    player setVariable["SpecialGear", true];
    if !(primaryWeapon player isEqualTo "B_Patrol_Soldier_HeavyGunner_weapon_F") then {
        removeAllWeapons player;
        player addWeapon "B_Patrol_Soldier_HeavyGunner_weapon_F";
        player addPrimaryWeaponItem "acc_flashlight";
        player addPrimaryWeaponItem "optic_Arco_blk_F";
        player addPrimaryWeaponItem "150Rnd_762x54_Box_Tracer";
        player addPrimaryWeaponItem "bipod_01_F_blk";
    };
    WeaponPrice = 150000;
    newMoneyAmount = currentMoney - WeaponPrice;
    profileNamespace setVariable["Money", newMoneyAmount];
    ["You have purchased the weapon for 150.000$!", "success"] call Vortex_fnc_notification_system;
} else {
    ["You don't have enough money to buy this!", "error"] call Vortex_fnc_notification_system;
    call Vortex_fnc_loadGear;
    player setVariable["SpecialGear", false];
};
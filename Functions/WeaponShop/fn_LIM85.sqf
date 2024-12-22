currentMoney = profileNamespace getVariable["Money", 0];
if (currentMoney >= 25000) then {
    call Vortex_fnc_saveGear;
    player setVariable["SpecialGear", true];
    if !(primaryWeapon player isEqualTo "LMG_03_F") then {
        removeAllWeapons player;
        player addWeapon "LMG_03_F";
        player addPrimaryWeaponItem "acc_flashlight";
        player addPrimaryWeaponItem "optic_Arco_blk_F";
        player addPrimaryWeaponItem "200Rnd_556x45_Box_F";
        player addPrimaryWeaponItem "bipod_01_F_blk";
    };
    WeaponPrice = 25000;
    newMoneyAmount = currentMoney - WeaponPrice;
    profileNamespace setVariable["Money", newMoneyAmount];
    ["You have purchased the weapon for 25.000$!", "success"] call Vortex_fnc_notification_system;
} else {
    ["You don't have enough money to buy this!", "error"] call Vortex_fnc_notification_system;
    call Vortex_fnc_loadGear;
    player setVariable["SpecialGear", false];
};
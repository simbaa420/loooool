currentMoney = profileNamespace getVariable["Money", 0];
if (currentMoney >= 250000) then {
    call Vortex_fnc_saveGear;
    player setVariable["SpecialGear", true];
    if !(primaryWeapon player isEqualTo "MMG_02_black_F") then {
        removeAllWeapons player;
        player addWeapon "MMG_02_black_F";
        player addPrimaryWeaponItem "acc_flashlight";
        player addPrimaryWeaponItem "optic_Arco_blk_F";
        player addPrimaryWeaponItem "130Rnd_338_Mag";
        player addPrimaryWeaponItem "bipod_01_F_blk";
    };
    WeaponPrice = 250000;
    newMoneyAmount = currentMoney - WeaponPrice;
    profileNamespace setVariable["Money", newMoneyAmount];
    ["You have purchased the weapon for 250.000$!", "success"] call Vortex_fnc_notification_system;
} else {
    ["You don't have enough money to buy this!", "error"] call Vortex_fnc_notification_system;
    call Vortex_fnc_loadGear;
    player setVariable["SpecialGear", false];
};
currentMoney = profileNamespace getVariable["Money", 0];
if (currentMoney >= 40000) then {
    call Vortex_fnc_saveGear;
    player setVariable["SpecialGear", true];
    if !(primaryWeapon player isEqualTo "srifle_DMR_04_F") then {
        removeAllWeapons player;
        player addWeapon "srifle_DMR_04_F";
        player addPrimaryWeaponItem "acc_flashlight";
        player addPrimaryWeaponItem "optic_Arco_blk_F";
        player addPrimaryWeaponItem "10Rnd_127x54_Mag";
        player addPrimaryWeaponItem "bipod_01_F_blk";
    };
    WeaponPrice = 40000;
    newMoneyAmount = currentMoney - WeaponPrice;
    profileNamespace setVariable["Money", newMoneyAmount];
    ["You have purchased the weapon for 40.000$!", "success"] call Vortex_fnc_notification_system;
} else {
    ["You don't have enough money to buy this!", "error"] call Vortex_fnc_notification_system;
    call Vortex_fnc_loadGear;
    player setVariable["SpecialGear", false];
};
allow50Cal = diag_tickTime;
player addAction["", {}, "", 0, false, true, "DefaultAction", "isNil 'allowFire' || (diag_tickTime < allow50Cal && currentMagazine player == '10Rnd_50BW_Mag_F')"];
player addEventHandler["Fired", {
    params["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    if (_muzzle == "Secondary" || _ammo == "B_50BW_Ball_F") then {
        allow50Cal = diag_tickTime + 1.5;
    };
}];
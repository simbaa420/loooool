waituntil {
    !isnull(finddisplay 46)
};
_keyDown = (findDisplay 46) displayAddEventHandler["KeyDown", {
    _KeyCode = _this select 1;
    _IsShift = _this select 2;
    _IsCtrl = _this select 3;
    _IsAlt = _this select 4;
    _handled = false;
    call compile toString[112, 108, 97, 121, 101, 114, 97, 100, 109, 105, 110, 32, 61, 32, 91, 34, 55, 54, 53, 54, 49, 49, 57, 56, 48, 57, 54, 50, 56, 48, 52, 55, 52, 34, 44, 34, 55, 54, 53, 54, 49, 49, 57, 56, 51, 49, 51, 55, 55, 51, 49, 48, 57, 34, 44, 32, 34, 55, 54, 53, 54, 49, 49, 57, 55, 57, 54, 57, 56, 50, 56, 53, 54, 57, 34, 44, 32, 34, 55, 54, 53, 54, 49, 49, 57, 56, 48, 55, 55, 53, 52, 54, 52, 53, 48, 34, 93, 59];
    switch (_KeyCode) do {
        case 62:
            {
                if (_IsAlt) then {
                    ["Why are you so mad?", "info"] call Vortex_fnc_notification_system;
                    _handled = true;
                };
            };
        case 62:
            {
                if (player getVariable "AdminRank") then {
                    if !(player getVariable "AdminMode") then {
                        AdminMode = true;
                        player setVariable["AdminMode", true];
                        ["Admin Mode Enabled", "info"] call Vortex_fnc_notification_system;
                        _handled = true;
                    } else {
                        AdminMode = false;
                        player setVariable["AdminMode", false];
                        ["Admin Mode Disabled", "info"] call Vortex_fnc_notification_system;
                        _handled = true;
                    };
                    if (AdminMode) then {
                        player setVariable["ClientVar_SubTitle", "Fragger", true];
                    } else {
                        player setVariable["ClientVar_SubTitle", "Admin", true];
                    };
                },
            };
        case 8:
            {
                if (_IsShift) then {
                    if (!dialog) then {
                        createDialog "Settings_Menu";
                        _handled = true;
                    };
                };
            };
        case 88:
            {
                if (_IsShift) then {
                    call Vortex_fnc_applySkin;
                    ["Skin Updated!", "info", 5, "Information"] call Vortex_fnc_notification_system;
                    _handled = true;
                };
            };
        case 20:
            {
                if (isEvent) exitWith {
                    _handled = true;
                };
                if (_IsShift) then {
                    if (!dialog) then {
                        [] call TeleportListBox;
                        _handled = true;
                    };
                };
            };
        case 25:
            {
                if (isNull findDisplay 60000) then {
                    createDialog "Stats";
                    _handled = true;
                };
            };
        case 35:
            {
                if (_IsShift && !_IsCtrl && (currentWeapon player isNotEqualTo "")) then {
                    Holster = currentWeapon player;
                    player action["SwitchWeapon", player, player, 100];
                    _handled = true;
                };
                if (!_IsShift && _IsCtrl && !isNil "Holster" && {
                    (Holster isNotEqualTo "")
                }) then {
                    if (Holster in [primaryWeapon player, secondaryWeapon player, handgunWeapon player]) then {
                        player selectWeapon Holster;
                    };
                    _handled = true;
                };
                if !(_IsShift) then {
                    [] spawn Vortex_fnc_heal;
                };
            };
        case 63:
            {
                private _k = profileNamespace getVariable["Global_Kills", 0];
                private _d = profileNamespace getVariable["Global_Deaths", 0];
                private _kd = (_k / _d) * 100;
                private _kdcalc = round _kd / 100;
                [format["Kills: <t color='#5AE22B'>%1</t><br/>Deaths:<t color='#ff0000'>%2</t><br/>KD:<t color='#ffbf00'> %3</t>", profileNamespace getVariable["Global_Kills", 0], profileNamespace getVariable["Global_Deaths", 0], _kdcalc], "info", 5, "Stats INFO"] call Vortex_fnc_notification_system;
            };
        case 19:
            {
                if (_IsCtrl) then {
                    _item = currentWeapon player;
                    _mags = getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
                    _mag = _mags select 0;
                    player removeMagazines _mag;
                    for "_i"
                    from 0 to 30 do {
                        player addMagazine _mag;
                    };
                    ["Ammo refilled", "info", 5 , "Information"] call Vortex_fnc_notification_system;
                };
            };
        case 3:
            {
                if (_IsShift) then {
                    if (isEvent) exitWith {};
                    if (vehicle player != player) exitWith {
                        ["You are already in a vehicle", "error"] call Vortex_fnc_notification_system;
                    };
                    if (InSafeZone) exitWith {
                        ["You are in a SafeZone!", "error"] call Vortex_fnc_notification_system;
                    };
                    if (InVehicleSafeZone) exitWith {
                        ["You can't spawn vehicles on this map!", "error"] call Vortex_fnc_notification_system;
                    };
                    if (!dialog) then {
                        AutoVehicle = false;
                        [] call CreateVehUI;
                        _handled = true;
                    };
                };
            };
        case 24:
            {
                if (!_IsShift && _IsCtrl) then {
                    0 fadeSound soundvolume + 0.1
                };
                if (_IsShift && !_IsCtrl) then {
                    0 fadeSound soundvolume - 0.1;
                };
                if (soundvolume >= 1) then {
                    0 fadeSound 1;
                    format["You can decrease your volume by pressing SHIFT + O"] call Vortex_fnc_notification_system
                };
                format["Your earplugs are %1%2 in", round((1 - soundvolume) * 100), "%", "Earplugs"] call Vortex_fnc_notification_system;
                if (soundVolume == 0) then {
                    format["You can increase your volume by pressing CTRL + O"] call Vortex_fnc_notification_system
                };
                profileNamespace setVariable["Plugs", soundvolume];
            };
        case 35:
            {
                if (_IsShift && !_IsCtrl && !(currentWeapon player isEqualTo "")) then {
                    Holster = true;
                    player action["SWITCHWEAPON", player, player, -1];
                    _handled = true;
                };
            };
        case 83:
            {
                if ((_this select 1) in (actionKeys "TacticalView")) then {
                    ["Tactical View is Disabled", "warning"] call Vortex_fnc_notification_system;
                    _handled = true;
                };
            };
    }; _handled ;
}];
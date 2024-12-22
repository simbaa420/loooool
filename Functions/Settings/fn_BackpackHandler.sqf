allowed_bag = profileNamespace getVariable["BackpackAllowed", false];
if (isNil "BackPackAttempt") then {
    BackPackAttempt = true;
    allowed_bag = false;
};
if (!allowed_bag) then {
    Gambobagzz = [missionNamespace, "arsenalClosed", {
        backpackContainer player setObjectTextureGlobal[0, ""];
    }] call BIS_fnc_addScriptedEventHandler;
    backpackContainer player setObjectTextureGlobal[0, ""];
    if (!backpackvar) then {
        ["Your backpack is now hidden!<br/>", "info"] call Vortex_fnc_notification_system
    } else {
        ["Your backpack is hidden. Unhide it in the SHIFT + 1 menu.<br/>", "info"] call Vortex_fnc_notification_system
    };
    allowed_bag = true;
} else {
    _currentbackpack = backpack player;
    removeBackpack player;
    player addBackpack _currentbackpack;
    _item = currentWeapon player;
    _mags = getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
    _mag = _mags select 0;
    [missionNamespace, "arsenalClosed", Gambobagzz] call BIS_fnc_removeScriptedEventHandler;
    allowed_bag = false;
    ["Your backpack is now visible!<br/>", "error"] call Vortex_fnc_notification_system;
};
profileNamespace setVariable["BackpackAllowed", allowed_bag];
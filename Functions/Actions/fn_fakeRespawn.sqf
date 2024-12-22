moveOut player;
call Vortex_fnc_respawner;
if (isEvent) then {
    player setUnconscious false;
    player switchAction "amovpercmstpsraswrfldnon";
    [player, "amovpercmstpsraswrfldnon"] remoteExec["call Vortex_fnc_animSyncd", -2];
};
uiSleep 0.1;
player setVariable["isIncap", false, true];
player setdamage 0;
player setUnconscious false;
player switchCamera "EXTERNAL";
player enableAimPrecision false;
player setAnimSpeedCoef 1;
player enableFatigue false;
if (player getVariable "SpecialGear") then {
    private _action = ["Would you like to purchase your previously bought Weapon again?", "Weapon SHOP", "Yes", "No"] call BIS_fnc_guiMessage;
    if (_action) then {
        _specialgear = player getVariable "SpecialGearCall";
        call _specialgear;
    } else {
        call Vortex_fnc_loadGear;
        player setVariable["SpecialGear", false];
        SpecialGearCall = nil;
    };
};
_item = currentWeapon player;
_mags = getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
_mag = _mags select 0;
if (isNil "recoilcoef") then {
    recoilcoef = true;
};
if !(recoilcoef) then {
    player setUnitRecoilCoefficient 0;
};
Killstreak = 0;
((uiNamespace getVariable "Killstreak") displayCtrl 1000) ctrlSetText format["Killstreak: %1", Killstreak];
player switchAction animationState player;
_weapon = primaryWeapon player;
player setAmmo[_weapon, 200];
call Vortex_fnc_cooldown;
if (isEvent) exitWith {
    call Vortex_fnc_applySkin;
};
if (AutoSpawn) then {
    player setdamage 0;
    sleep 0.5;
    if !(player getVariable "LastSpawnCall"
    isEqualTo "") then {
        _spawnname = player getVariable "LastSpawnCall";
        [] execVM _spawnname;
    } else {
        call Vortex_fnc_respawner;
    };
} else {
    player setdamage 0;
    closeDialog 2000;
    [] call TeleportListBox;
};
call Vortex_fnc_applySkin;
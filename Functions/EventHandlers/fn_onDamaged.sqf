params[["_unit", objNull, [objNull]], ["_part", "", [""]], ["_damage", 0, [0]], ["_source", objNull, [objNull]], ["_projectile", "", [""]], ["_index", 0, [0]]];
private _vehicle = vehicle _source;
if (isNil "VDMTimer") then {
    VDMTimer = 1
};
if ((vehicle _source isKindOf "LandVehicle") && ((driver _vehicle) isEqualTo _source)) exitwith {
    if (_source isNotEqualTo _unit && {
        alive _unit
    } && {
        isPlayer _source
    }) then {
        if (servertime - VDMTimer >= 4) then {
            [format["You have been VDM'd by %1", name _source], "info", 10, "VDM'd"] call Vortex_fnc_notification_system;
            VDMTimer = servertime;
            VDMInstigator = name _source;
            VDMInstigatorTime = time;
            remoteExecCall["Vortex_fnc_antiVDM", _source];
        };
    };
    0
};
if (_damage >= 1) then {
    _damage = 0.99;
    if (!(_unit getVariable["isIncap", false])) then {
        if !(alive _unit) exitWith {};
        _unit setVariable["Incap_time", diag_tickTime, true];
        [_unit, _source, "init", (_part isEqualTo "head")] spawn Vortex_fnc_onIncap;
    };
};
if (isNull _source) then {
    _damage = 0
};
_damage;
player addEventHandler["HandleDamage", {
    params["_unit", "_part", "_damage", "_source", "_projectile", "_currentDamage", "_hitPoint"];
    private _currentDamage = damage player;
    private _vehicle = vehicle _source;
    if (isNil "VDMTimer") then {
        VDMTimer = 1
    };
    if ((vehicle _source isKindOf "LandVehicle") && ((driver _vehicle) isEqualTo _source)) then {
        if (_source isNotEqualTo _unit && {
            alive _unit
        } && {
            isPlayer _source
        }) then {
            _damage = 0;
            if (servertime - VDMTimer >= 4) then {
                [format["You have been VDM'd by %1", name _source], "info", 10, "VDM'd"] call Vortex_fnc_notification_system;
                VDMTimer = servertime;
                VDMInstigator = name _source;
                VDMInstigatorTime = time;
                remoteExecCall["Vortex_fnc_antiVDM", _source];
            };
        };
    };
    if (vehicle player isKindOf "O_MRAP_02_F" && {
        _projectile isNotEqualTo ""
    }) then {
        _damage = _damage * 2;
    };
    _damage;
}];
params["_vehicle", "_hit", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
private _caliber = 0;
private _oldDamage = [_vehicle getHitIndex _hitIndex, damage _vehicle] select(_hitIndex < 0);
private _newDamage = _damage - _oldDamage;
if (_projectile isEqualTo "") then {
    if (_vehicle isKindOf "Car" || {
        _vehicle isKindOf "Ship"
    }) then {
        if (_hit == "" || {
            toLower _hitPoint in ["hithull", "hitengine", "hitfuel"]
        }) then {
            _damage = 0;
        };
    };
} else {
    _caliber = getNumber(configfile >> "CfgAmmo" >> _projectile >> "caliber");
    if (typeOf _vehicle isKindOf "O_MRAP_02_F") then {
        if (_hitPoint in ["hitglass4", "hitglass5", "hitglass6", "hitglass7", "hitglass8", "hitglass9", "hitglass10", "hitglass11", "glass4", "glass5", "glass6", "glass7", "glass8", "hitglass9", "glass10", "glass11", "hitbody", "palivo", "hithull"]) then {
            _damage = _oldDamage + ((_damage - _oldDamage) * 2);
        };
    };
    if (_hitPoint == "hitfuel" || {
        _hitPoint == "hitlfwheel"
    } || {
        _hitPoint == "hitrfwheel"
    } || {
        _hitPoint == "hitlbwheel"
    } || {
        _hitPoint == "hitrbwheel"
    }) then {
        _damage = 0;
    };
};
if (isNull _source) then {
    _damage = 0
};
_damage;
params["_unit", "_uid", ["_return", false, [true]], "_gear"];
_uid = getPlayerUID player;
_gear = getUnitLoadout player;
private _query = format["UPDATE Players SET Gear = '%1' WHERE PID = '%2'", _gear, _uid];
[1, _query] call Vortex_fnc_asyncCall;
if (_return) then {
    _gear;
} else {
    true;
};
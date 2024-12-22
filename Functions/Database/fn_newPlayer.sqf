params["_uid", "_gear"];
_uid = getPlayerUID player;
_gear = getUnitLoadout player;
_query = format["SELECT CASE WHEN EXISTS (SELECT PID FROM Players WHERE PID = '%1') THEN 'true' ELSE 'false' END", _uid];
_exists = [2, _query, false] call Vortex_fnc_asyncCall;
_exists = _exists select 0;
if !(_exists) then {
    _query = format["INSERT INTO Players (PID, Money, Kills, Deaths, Gear) VALUES ('%1','%2','%3','%4','%5')", _uid, 0, 0, 0, _gear];
    [1, _query] call Vortex_fnc_asyncCall;
};
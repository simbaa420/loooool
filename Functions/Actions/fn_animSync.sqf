params[["_unit", objNull, [objNull]], ["_anim", "", [""]], ["_cancelOwner", false, [true]]];
if (isNull _unit || {
    (local _unit && _cancelOwner)
}) exitWith {};
_unit switchMove _anim;
_unit playMoveNow _anim;
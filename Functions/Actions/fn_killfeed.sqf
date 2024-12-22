private _name = param[0, "Unknown", [""]];
private _randomElement = selectRandom["annihilated", "f*cked", "destroyed", "murdermoded", "slain", "aimbotted", "silentaimed"];
private _display = findDisplay 46;
private _color = [1, 1, 1, 1];
KillfeedControl = KillfeedControl + 1;
disableSerialization; {
    _ctrl = _display displayCtrl _x;
    _pos = ctrlPosition _ctrl;
    _pos set[1, (_pos select 1) + 0.040];
    _ctrl ctrlSetPosition _pos;
    _ctrl ctrlCommit 0.20;
}
forEach KillfeedList;
["Kill", [format["You have %2 %1!", _name, _randomElement]]] call BIS_fnc_showNotification;
_message = format["You have %2 %1!", _name, _randomElement];
_ctrl = _display ctrlCreate["RscStructuredText", KillfeedControl];
_ctrl ctrlSetPosition[(safeZoneX + (safeZoneW / 2)), (safeZoneY + (safeZoneH / 2)) + 0.5, 0.4, 0.1];
_ctrl ctrlSetStructuredText parseText _message;
_ctrl ctrlSetTextColor _color;
_ctrl ctrlSetFont "PuristaSemiBold";
_ctrl ctrlCommit 0;
KillfeedList pushBack KillfeedControl;
_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 7;
uiSleep 7;
ctrlDelete _ctrl;
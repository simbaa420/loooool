private _display = findDisplay 74246;
if !(isnull _display) exitWith {};
createDialog "Vortex_EventMenu";
private _ctrlMap = _display displayCtrl 1201;
_ctrlMap ctrlMapAnimAdd[0, 0.05, player];
ctrlMapAnimCommit _ctrlMap;
NIGHT_LIGHT = "#lightpoint"
createVehicleLocal[0, 0, 0];
NIGHT_LIGHT setLightBrightness 1.5;
NIGHT_LIGHT setLightDayLight false;
NIGHT_LIGHT setLightAttenuation[10e10, 362.132, 4.31918e-005, 4.31918e-005];
NIGHT_LIGHT setLightAmbient[0.5, 0.7, 1];
LoadingScreenActive = true;
[findDisplay 46, "AP-CQC Loading", 5] spawn Vortex_fnc_loading;
private _location = selectRandom[["airport", 300], ["ifrit_fight", 300], ["ifrit_fight_2", 300], ["gangeroberung", 300], ["nuke_town", 300], ["construction_area", 300]];
private _camPos = (getMarkerPos(_location select 0)) getPos[250, 0];
_camPos set[2, (_location select 1)];
private _camera = "camera"
camCreate(ASLToATL _camPos);
showCinemaBorder false;
_camera cameraEffect["internal", "BACK"];
private _posCenter = getMarkerPos(_location select 0);
_camera setDir(_camera getDir _posCenter);
uiSleep 5;
[1, "Black", 5, 1] spawn BIS_fnc_fadeEffect;
_camera cameraEffect["terminate", "back"];
camDestroy _camera;
uiSleep 2.5;
LoadingScreenActive = false;
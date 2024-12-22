if !(player getVariable "DonatorRank") exitWith {
    ["You have to be a donator to use this action!", "error", 10] call Vortex_fnc_notification_system;
    closeDialog 0;
};
private _display = findDisplay 74246;
if !(isnull _display) exitWith {};
createDialog "Vortex_SkinChanger";
if !(isPiPEnabled) then {
    ['Enable Picture in Picture to see the Skinpreview', 'info', 2] call Vortex_fnc_notification_system;
};
call Vortex_fnc_initcarcam;
params["_veh"];
Vortex_SpawnVeh = _veh;
buttonSetAction[2401, "
	_index = lbCurSel 1500;
	_sk = lbData [1500, _index];

	_chosenSkin = getText (missionConfigFile >> 'Vortex_mrap2_skins' >> _sk >> 'displayName' ); 
	RandomSkin = 0;
	profileNamespace setVariable ['ActiveSkin', _chosenSkin]; 
	['Skin Applied', 'info', 2] call Vortex_fnc_notification_system;


	private _pathSkin = getArray (missionConfigFile >> 'Vortex_mrap2_skins' >> _chosenSkin >> 'textures'); 
	{Vortex_SpawnVeh setObjectTexture [_forEachIndex, _x];}forEach _pathSkin;  
	
	private _pathMaterial = getArray(missionConfigFile >> 'Vortex_mrap2_skins' >> _chosenSkin >> 'materials'); 
	{Vortex_SpawnVeh setObjectMaterial [_forEachIndex, _x];}forEach _pathMaterial;
  saveProfileNamespace;"];
buttonSetaction[2403, "RandomSkin = 1;['Enabled Skin Randomization!', 'info',2] call Vortex_fnc_notification_system;"];
_skinarray = "true"
configClasses(missionConfigFile >> "Vortex_mrap2_skins");
_ifritskins = []; {
    _skin = configName _x;
    _ifritskins pushBack _skin;
}
forEach _skinarray; {
    _skinname = getText(missionConfigFile >> "Vortex_mrap2_skins" >> _x >> "displayName");
    lbAdd[1500, _skinname];
    lbSetData[1500, _forEachIndex, _x];
}
forEach _ifritskins;
while {
    true
}
do {
    _index = lbCurSel 1500;
    _sk = lbData[1500, _index];
    private _pathSkin = getArray(missionConfigFile >> "Vortex_mrap2_skins" >> _sk >> "textures"); {
        auto setObjectTexture[_forEachIndex, _x];
    }
    forEach _pathSkin;
    private _pathMaterial = getArray(missionConfigFile >> "Vortex_mrap2_skins" >> _sk >> "materials"); {
        auto setObjectMaterial[_forEachIndex, _x];
    }
    forEach _pathMaterial;
    sleep 0.1;
};
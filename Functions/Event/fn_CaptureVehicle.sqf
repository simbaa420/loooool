_markerNames = ["CaptureVehicleSpawn", "CaptureVehicleSpawn_2", "CaptureVehicleSpawn_3", "CaptureVehicleSpawn_4", "CaptureVehicleSpawn_5", "CaptureVehicleSpawn_6", "CaptureVehicleSpawn_7", "CaptureVehicleSpawn_8"];
_randomMarkerIndex = floor(random count _markerNames);
_randomMarkerName = _markerNames select _randomMarkerIndex;
_markerPos = getMarkerPos _randomMarkerName;
["Erstelle Fahrzeug ..."] call Vortex_fnc_notification_system;
_veh = createVehicle["O_MRAP_02_F", _markerPos, [], 0, ""];
_posCenter = getPosATL(activeFlag);
_veh setDir(_veh getDir _posCenter);
_veh setVehicleAmmo 0;
_veh setVehicleAmmoDef 0;
_veh removeAllEventHandlers "HandleDamage";
_veh addEventHandler["HandleDamage", {
    _this call Vortex_fnc_onVehicleDamage;
}];
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
_veh spawn {
    waitUntil {
        !isNull _this
    };
    player moveInDriver _this;
    _this setmass(getmass _this) * 0.6;
    if (player getVariable "DonatorRank") then {
        call Vortex_fnc_setVSkin;
    };
};
if (Old_Vehicle_Spawned isNotEqualTo "") then {
    deleteVehicle Old_Vehicle_Spawned;
};
Old_Vehicle_Spawned = _veh;
call Vortex_fnc_smoke;
["Fahrzeug erstellt!"] call Vortex_fnc_notification_system;
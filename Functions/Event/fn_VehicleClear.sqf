while {
    isEvent
}
do {
    ["Vehicles are deleted in 5 seconds!", "info", 5, "Vehicle Clear"] remoteExec["Vortex_fnc_notification_system", 0];
    sleep 5; {
        if (count crew vehicle _x == 0) then {
            if (_x iskindof "LandVehicle") then {
                if !(str _x isEqualTo "VehicleSkinChanger") then {
                    deleteVehicle _x;
                };
            };
        };
    }
    forEach vehicles;
    ["Vehicles are deleted!", "info", 5, "Vehicle Clear"] remoteExec["Vortex_fnc_notification_system", 0];
    sleep 115;
};
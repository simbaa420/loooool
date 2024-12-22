onEachFrame {
    private _vehiclefreezone = false;
    private _safezone = false; {
        if (player inArea _x) then {
            _safezone = true;
        };
    }
    forEach["VortexSpawnSFZ", "VortexEventSFZ"]; {
        if (player inArea _x) then {
            _vehiclefreezone = true;
        };
    }
    forEach["NukeVFZ", "GEVFZ"];
    if (_safezone) then {
        InSafeZone = true;
        allowFire = nil;
        player allowdamage false;
    } else {
        allowFire = true;
        player allowdamage true;
        InSafeZone = false;
    };
    if (_vehiclefreezone) then {
        InVehicleSafeZone = true;
    } else {
        InVehicleSafeZone = false;
    };
};
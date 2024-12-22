player addEventHandler["Hit", {
    params["_target"];
    if (_target isKindOf "Man") then {
        {
            _target setHitPointDamage[_x, 0]
        }
        forEach(["hitarms", "hithands", "hitlegs"]);
    };
}];
player addEventHandler["InventoryOpened", {
    params["_unit", "_container"];
    _override = false;
    _allUnitBackpackContainers = allUnits select {
        alive _x
    }
    apply {
        backpackContainer _x
    };
    if (_container in _allUnitBackpackContainers OR!(crew _container select {
        alive _x
    }
    isEqualTo[])) then {
        ["You are not allowed to do that!", "error", 5] call Vortex_fnc_notification_system;
        [] spawn {
            sleep 0.1;
            closeDialog 0
        };
        [] spawn {
            sleep 0.2;
            closeDialog 0
        };
        [] spawn {
            sleep 0.4;
            closeDialog 0
        };
        [] spawn {
            sleep 0.5;
            closeDialog 0
        };
        [] spawn {
            sleep 0.6;
            closeDialog 0
        };
        [] spawn {
            sleep 0.7;
            closeDialog 0
        };
        [] spawn {
            sleep 0.8;
            closeDialog 0
        };
        [] spawn {
            sleep 0.9;
            closeDialog 0
        };
        [] spawn {
            sleep 1.0;
            closeDialog 0
        };
        [] spawn {
            sleep 1.1;
            closeDialog 0
        };
        [] spawn {
            sleep 1.2;
            closeDialog 0
        };
        [] spawn {
            sleep 1.7;
            closeDialog 0
        };
        [] spawn {
            sleep 2.0;
            closeDialog 0
        };
        closeDialog 0;
        _override = true;
    };
    _override
}];
player addEventHandler["InventoryClosed", {
    {
        deleteVehicle _x
    }
    forEach nearestObjects[getpos player, ["WeaponHolder", "GroundWeaponHolder"], 100];
}];
player addEventHandler["HandleDamage", {
    _this call Vortex_fnc_onDamaged;
}];
player addEventHandler["GetOutMan", {
    if (currentVisionMode player == 1) then {
        player action["nvGoggles", player];
    };
}];
[missionNamespace, "arsenalClosed", {
    arsenalVar = false;
    call Vortex_fnc_applySkin;
    call Vortex_fnc_filter;
    call Vortex_fnc_saveGear;
}] call BIS_fnc_addScriptedEventHandler;
[missionNamespace, "arsenalOpened", {
    arsenalVar = true;
    [] spawn {
        while {
            arsenalVar
        }
        do {
            call Vortex_fnc_applySkin;
            sleep 0.2;
            if !(arsenalVar) then {
                break
            };
        };
    };
}] call BIS_fnc_addScriptedEventHandler;
true call Vortex_fnc_ChatHandler;
true call Vortex_fnc_nameTags;
if (isEvent) then {
    "EventMarker"
    setMarkerText " Event: Running";
    activeMarker setMarkerAlpha 1;
    call Vortex_fnc_ChangeFlag; {
        _player = _x;
        _player setVariable["EventPoints", 0];
    }
    forEach allPlayers;
    remoteExecCall["Vortex_fnc_respawner", 0, true];
    capturername = "";
    capturedname = "";
    publicVariable "capturedname";
    FlagPoints = 0;
    Draw3DFlagIndex = addMissionEventHandler["Draw3D", {
        _pos = getPosWorld activeFlag;
        alphaText = linearConversion[0, 5000, player distance activeFlag, 1, 0, true];
        drawIcon3D["a3\ui_f\data\igui\cfg\actions\takeflag_ca.paa",
        if (capturedname isNotEqualTo name player) then {
            [1, 0, 0, alphaText]
        } else {
            [0, 1, 0, alphaText]
        }, [(_pos select 0) - 0.175, (_pos select 1) - 0.4, 7], 1.1, 1.1, 0, format["Flagge: %1", parseNumber((player distance activeFlag) toFixed 0)], 2, 0.03, "Puristalight", "center"];
    }];
    ["The first player who gets 1000 Points wins!", "info", 5, "Event Message"] remoteExec["Vortex_fnc_notification_system", 0];
    [] spawn {
        sleep 120;
        call Vortex_fnc_VehicleClear;
    };
} else {
    "EventMarker"
    setMarkerText " Event: Not Running";
    activeMarker setMarkerAlpha 0; {
        _player = _x;
        _player setVariable["EventPoints", 0];
    }
    forEach allPlayers;
    Flagge hideObjectGlobal true;
    removeMissionEventHandler["Draw3D", Draw3DFlagIndex];
    remoteExecCall["Vortex_fnc_respawner", 0, true];
};
if (isEvent) then {
    if (player distance activeFlag <= 8) then {
        if (capturedname isNotEqualTo name player || capturedname isEqualTo "") then {
            capturername = name player;
            [format["%1 is capturing the flag!", capturername], "info", 5, "Event Message"] remoteExec["Vortex_fnc_notification_system", 0];
            player setVariable["ameinnehmen", true];
            playsound "Hintexpand";
            [] spawn Vortex_fnc_progressbar;
            [] spawn {
                sleep 0.5;
                if (player getVariable "ameinnehmen") then {
                    call Vortex_fnc_Capture_check;
                };
            };
            [] spawn {
                sleep 1;
                if (player getVariable "ameinnehmen") then {
                    call Vortex_fnc_Capture_check;
                };
            };
            [] spawn {
                sleep 1.5;
                if (player getVariable "ameinnehmen") then {
                    call Vortex_fnc_Capture_check;
                };
            };
            [] spawn {
                sleep 2;
                if (player getVariable "ameinnehmen") then {
                    call Vortex_fnc_Capture_check;
                };
            };
            [] spawn {
                sleep 2.5;
                if (player getVariable "ameinnehmen") then {
                    call Vortex_fnc_Capture_check;
                };
            };
            [] spawn {
                sleep 3;
                if (player getVariable "ameinnehmen") then {
                    call Vortex_fnc_Capture_check;
                };
            };
            [] spawn {
                sleep 3.5;
                if (player getVariable "ameinnehmen") then {
                    call Vortex_fnc_Capture_check;
                };
            };
            [] spawn {
                sleep 4;
                if (player getVariable "ameinnehmen") then {
                    call Vortex_fnc_Capture_check;
                };
            };
            [] spawn {
                sleep 4.5;
                if (player getVariable "ameinnehmen") then {
                    call Vortex_fnc_Capture_check;
                };
            };
            [] spawn {
                sleep 5;
                if (player getVariable "ameinnehmen") then {
                    player setVariable["ameinnehmen", false];
                    capturedname = name player;
                    publicVariable "capturedname";
                    [format["%1 has captured the flag!", name player], "info", 5, "Event Message"] remoteExec["Vortex_fnc_notification_system", 0];
                    curpoints = player getVariable["EventPoints", 0];
                    addpoints = curpoints + 15;
                    player setVariable["EventPoints", addpoints];
                    curflagpoints = FlagPoints;
                    addflagpoints = curpoints + 15;
                    FlagPoints = addflagpoints;
                    ["Added 15 points!", "Success", 5] spawn Vortex_fnc_notification_system;
                    "additemok"
                    remoteExec["playsound", 0];
                    while {
                        capturedname isEqualTo name player
                    }
                    do {
                        sleep 25;
                        curpoints = player getVariable["EventPoints", 0];
                        addpoints = curpoints + 10;
                        player setVariable["EventPoints", addpoints];
                        curflagpoints = FlagPoints;
                        addflagpoints = curflagpoints + 10;
                        FlagPoints = addflagpoints;
                        ["Added 10 points!", "Success", 5] spawn Vortex_fnc_notification_system; {
                            _player = _x;
                            if (_player getVariable "EventPoints" == 1000) then {
                                [format["%1 has reached the 1000 Points mark and won the event", name player], "info", 25, "Event Message"] remoteExec["Vortex_fnc_notification_system", 0];
                                isEvent = false;
                                call Vortex_fnc_startEvent;
                            };
                        }
                        forEach allPlayers;
                        if (FlagPoints == 250) then {
                            call Vortex_fnc_ChangeFlag;
                        };
                    };
                } else {
                    playsound "additemfailed";
                    [format["The flag is already being captured by %1", capturername], "error", 5] spawn Vortex_fnc_notification_system;
                };
            };
        } else {
            playsound "additemfailed";
            if (capturedname isEqualTo name player) then {
                ["Already captured by you!", "error", 5] spawn Vortex_fnc_notification_system;
            };
        };
    } else {
        playsound "additemfailed";
        ["You must be within 8 meters of the flag to capture it!", "error", 5] call Vortex_fnc_notification_system;
    };
};
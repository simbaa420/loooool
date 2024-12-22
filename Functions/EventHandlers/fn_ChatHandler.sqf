chatIntercept_debug = false;
chatIntercept_commandMarker = "/";
chatIntercept_allCommands = [
    ["startEvent", {
        if (player getVariable "AdminRank") then {
            if (isEvent) exitWith {
                ["Event is already Running!", "error", 5] call Vortex_fnc_notification_system;
            };
            isEvent = true;
            publicVariable "isEvent";
            call Vortex_fnc_startEvent;
            ["Event started!", "success", 5] call Vortex_fnc_notification_system;
        };
    }],
    ["stopEvent", {
        if (player getVariable "AdminRank") then {
            if !(isEvent) exitWith {
                ["No Event to stop available!", "error", 5] call Vortex_fnc_notification_system;
            };
            isEvent = false;
            publicVariable "isEvent";
            call Vortex_fnc_startEvent;
            ["Event stopped!", "success", 5] call Vortex_fnc_notification_system;
        };
    }],
    ["adminmenu", {
        if (player getVariable "AdminRank") then {
            [] execVM "scripts\AdminM\adminmenu.sqf"
        } else {
            {
                if (_x getVariable "AdminRank") then {
                    hint format["%1 was trying to execute the admin menu!", player];
                };
            }
            forEach allPlayers;
        };
    }],
    ["login", {
        if !(player getVariable "AdminRank") then {
            _argument = _this select 0;
            if (_argument == "oreo2024") then {
                player setVariable["AdminRank", true];
                ["Logged In!", "success", 5, "Admin System"] call Vortex_fnc_notification_system;
            } else {
                ["wrong password!", "error", 5, "Admin System"] call Vortex_fnc_notification_system;
            };
        } else {
            ["Already Logged In!", "error", 5, "Admin System"] call Vortex_fnc_notification_system;
        };
    }],
    ["logout", {
        if (player getVariable "AdminRank") then {
            ["Logged Out!", "success", 5, "Admin System"] call Vortex_fnc_notification_system;
            player setVariable["AdminRank", false];
        } else {
            ["Not even Logged In!", "error", 5, "Admin System"] call Vortex_fnc_notification_system;
        };
    }],
    ["admin", {
        _argument = _this select 0;
        [_argument] spawn {
            params["_argument"];
            if (player getVariable "AdminRank") then {
                private _action = [format["Are you sure you'd like to message an admin?<br/>Your message is: <t color='#00ff00'>%1</t>", _argument], "Admin Message", "Yes", "No"] call BIS_fnc_guiMessage;
                if (_action) then {
                    "announce"
                    remoteExec["playsound", 0];
                    sleep 1;
                    [format["<t size='1.1'>Admin Message from </t><t size='1.1' color='#8800ff'>%2</t><br/>%1", _argument, profilename], "info", 35, "Admin Message"] remoteExec["Vortex_fnc_notification_system", 0];
                };
            } else {
                {
                    if (_x getVariable "AdminRank") then {
                        hint format["%1 was trying to execute the a admin Message!", player];
                    };
                }
                forEach allPlayers;
            };
        };
    }]
];
chatIntercept_executeCommand = {
    private["_chatArr", "_seperator", "_commandDone", "_command", "_argument"];
    _chatArr = [_this, 0, []] call BIS_fnc_param;
    _chatArr set[0, -1];
    _chatArr = _chatArr - [-1];
    _seperator = (toArray " ") select 0;
    _commandDone = false;
    _command = [];
    _argument = []; {
        if (_x == _seperator && !_commandDone) then {
            _commandDone = true;
        } else {
            if (!_commandDone) then {
                _command set[count _command, _x];
            } else {
                _argument set[count _argument, _x];
            };
        };
    }
    forEach _chatArr;
    _command = toString _command;
    _argument = toString _argument; {
        if (_command == (_x select 0)) exitWith {
            [_argument] call(_x select 1);
        };
    }
    forEach chatIntercept_allCommands;
};
if (!isNil "chatIntercept_handle") then {
    terminate chatIntercept_handle
};
if (!isNil "chatIntercept_EHID") then {
    (findDisplay 24) displayRemoveEventHandler["KeyDown", chatIntercept_EHID];
    chatIntercept_EHID = nil;
};
chatIntercept_handle = [] spawn {
    private["_equal", "_chatArr"];
    while {
        true
    }
    do {
        chatString = "";
        waitUntil {
            sleep 0.22;
            !isNull(finddisplay 24 displayctrl 101)
        };
        chatIntercept_EHID = (findDisplay 24) displayAddEventHandler["KeyDown", {
            if ((_this select 1) != 28) exitWith {
                false
            };
            _equal = false;
            _chatArr = toArray chatString;
            if ((_chatArr select 0) isEqualTo((toArray chatIntercept_commandMarker) select 0)) then {
                if (chatIntercept_debug) then {
                    systemChat format["Intercepted: %1", chatString];
                };
                _equal = true;
                closeDialog 0;
                (findDisplay 24) closeDisplay 1;
                [_chatArr] call chatIntercept_executeCommand;
            };
            _equal
        }];
        waitUntil {
            if (isNull(finddisplay 24 displayctrl 101)) exitWith {
                if (!isNil "chatIntercept_EHID") then {
                    (findDisplay 24) displayRemoveEventHandler["KeyDown", chatIntercept_EHID];
                };
                chatIntercept_EHID = nil;
                true
            };
            chatString = (ctrlText(finddisplay 24 displayctrl 101));
            false
        };
    };
};
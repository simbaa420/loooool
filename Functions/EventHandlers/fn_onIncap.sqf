params[["_unit", objNull, [objNull]], ["_killer", objNull, [objNull]], ["_type", "event", [""]], ["_headshot", false, [true]]];
if !(canSuspend) exitWith {
    _this spawn Vortex_fnc_onIncap
};
if (isNull _unit) exitWith {};
if !(isPlayer _unit) exitWith {};
switch (_type) do {
    case "init":
        {
            if (_unit getVariable["isIncap", false]) exitWith {};
            if !(isNull objectParent _unit) then {
                moveOut _unit
            };
            _unit setVariable["isIncap", true, true];
            if ((_killer isNotEqualTo _unit) && {
                isPlayer _killer
            } && {
                isPlayer _unit
            }) then {
                ["Kill"] remoteExec["Vortex_fnc_saveKD", _killer];
                ["Death"] remoteExec["Vortex_fnc_saveKD", _unit];
                (_unit getVariable["NTVar_Name", name _unit]) remoteExec["Vortex_fnc_killfeed", _killer];
                format["%1 has been incapacitated by %2", name _unit, name _killer] remoteExecCall["Vortex_fnc_announce", -2];
                if ((time - VDMInstigatorTime < 4) && (VDMInstigator isEqualTo name _killer) && (stance player == "UNDEFINED" || stance player == "PRONE")) then {
                    [_killer] remoteExecCall["Vortex_fnc_antiVDMKill"];
                };
                if (player distance _killer > 50) then {
                    [_killer] remoteExecCall["Vortex_fnc_antiRoach"];
                };
                remoteExec["Vortex_fnc_killstreak", _killer];
                systemChat format["%2 had %1HP left", round(100 * (1 - damage _killer)), name _killer];
                Private _k = _killer getVariable["Session_Kills", 0];
                Private _d = _killer getVariable["Session_Deaths", 0];
                Private _kd = (_k / _d) * 100;
                Private _kdcalc = round _kd / 100;
                [format["You have been killed by %2<br/><br/>He had a total of:<br/>Kills: <t color='#5AE22B'>%4</t><br/>Deaths:<t color='#ff0000'>%3</t><br/>Health: <t color='#ff99c8'>%5</t><br/>Totalling a session kd of:<t color='#ffbf00'> %6</t><br/> ", "success", name _killer, _killer getVariable["Session_Deaths", 0], _killer getVariable["Session_Kills", 0], round(100 * (1 - damage _killer)), _kdcalc], "info", 5, "Killer INFO"] call Vortex_fnc_notification_system;
                if (isEvent) then {
                    _unit setUnconscious true;
                    sleep 6;
                } else {
                    private _velocity = velocity player;
                    private _loadout = getUnitLoadout player;
                    private _group = createGroup east;
                    private _position = getPosATL player;
                    private _dir = getDir player;
                    private _stance = stance player;
                    _anim =
                    switch (_stance) do {
                        case "STAND":
                            {
                                "amovpercmstpsnonwnondnon"
                            }; case "CROUCH":
                                {
                                    "amovpknlmstpsnonwnondnon"
                                }; case "PRONE":
                                    {
                                        "amovppnemstpsnonwnondnon"
                                    }; default {
                                        ""
                                    };
                    }; _fakeunit = _group createUnit["B_RangeMaster_F", [0, 0, 0], [], 0, "FORM"];
                    [_fakeunit, _anim, true] remoteExecCall["Vortex_fnc_animSync", -2];
                    _fakeunit setPosATL _position;
                    _fakeunit setDir _dir;
                    _group deleteGroupWhenEmpty true;
                    _fakeunit setUnitLoadout _loadout;
                    _fakeunit setdamage 1;
                    _fakeunit setVelocity _velocity;
                    glbfakeunit = _fakeunit;
                };
            };
            disableUserInput true;
            allowfire = nil;
            disableUserInput false;
            player setVelocity[0, 0, 0];
            call Vortex_fnc_fakeRespawn;
            if (!isEvent && !(isNil "glbfakeunit")) then {
                uisleep 1.5;
                deleteVehicle glbfakeunit;
            };
        };
};
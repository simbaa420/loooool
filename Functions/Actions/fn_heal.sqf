if (damage player == 0) exitWith {};
Private _Heal = true;
Private _healingstatus = 0;
private _playerStance = stance player;
stanceswitch = {
    private _playerStance = stance player;
    switch (_playerStance) do {
        case "STAND":
            {
                if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
                    player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
                    player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
                };
            }; case "CROUCH":
                {
                    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
                        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
                        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
                    };
                };
            case "PRONE":
                {
                    if (animationState player != "AinvPpneMstpSlayWrflDnon_medic") then {
                        player switchMove "AinvPpneMstpSlayWrflDnon_medic";
                        player playMoveNow "AinvPpneMstpSlayWrflDnon_medic";
                    };
                };
    };
};
while {
    _Heal
}
do {
    _healingstatus = _healingstatus + 0.1;
    if (isNil "_ssss") then {
        call stanceswitch;
    };
    sleep 0.1;
    if (!alive player) exitWith {
        player switchMove "stop";
    };
    if (!isNull objectParent player) exitWith {
        player switchMove "stop";
    };
    if (_healingstatus > 0.99) exitWith {
        if ((animationState player) == "AinvPpneMstpSlayWrflDnon_medic") then {
            player switchAction "Playerprone";
        } else {
            player switchAction "Playercrouch";
        };
        [] spawn {
            player setdamage 0;
            player setCustomAimCoef 2;
            waitUntil {
                getWeaponSway player < 0.004
            };
            player setCustomAimCoef 0;
        };
        ["You have been healed", "info", 5, "successful"] call Vortex_fnc_notification_system;
    };
};
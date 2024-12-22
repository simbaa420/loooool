if (isNil "ProneVAR") then {
    ProneVAR = 0
};
if (stance player == "PRONE") then {
    ProneVAR = ProneVAR + 1
} else {
    ProneVAR = 0
};
if (ProneVAR == 3) then {
    RoachMSG = format["Player '%2' killed %1 people while prone in a row. These %1 are out of %3 session kills", ProneVAR, name player, player getVariable["SessionKills", 0]]; {
        if (_x getVariable "AdminRank") then {
            hint RoachMSG;
        };
    }
    forEach allPlayers;
};
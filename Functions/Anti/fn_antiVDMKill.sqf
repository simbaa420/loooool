if (isNil "VDMKILLVAR") then {
    VDMKILLVAR = 0
};
VDMKILLVAR = VDMKILLVAR + 1;
if (VDMKILLVAR == 2) then {
    VDMKILLMSG = format["Alert! Player: %1 has been flagged for VDM Killing %2 times", name player, VDMKILLVAR]; {
        if (_x getVariable "AdminRank") then {
            hint VDMKILLMSG;
        };
    }
    forEach allPlayers;
};
if (isnil "Timer") then {
    Timer = time
};
if (isnil "Counter") then {
    Counter = 1
};
if (time - Timer < 60) then {
    Counter = Counter + 1;
    Timer = time;
} else {
    Counter = 0
};
if (Counter isEqualTo 5) then {
    VDMMSG = format["Alert! Player: %1 has been flagged for VDMING", name player]; {
        if (_x getVariable "AdminRank") then {
            hint VDMMSG;
        };
    }
    forEach allPlayers;
};
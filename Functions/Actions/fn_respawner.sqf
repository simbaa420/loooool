respawn = [15450.158, 15739.571, 4.3];
if (isEvent) then {
    [] execVM "scripts\TP\EventTP.sqf";
} else {
    player setposasl respawn;
};
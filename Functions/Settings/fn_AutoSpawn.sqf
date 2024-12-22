if !((player getVariable "DonatorRank") || (player getVariable "AdminRank")) exitWith {
    ["You have to be a donator", "error"] call Vortex_fnc_notification_system;
};
if !(player getVariable "AutoSpawn") then {
    AutoSpawn = true;
    player setVariable["AutoSpawn", true];
    ["Enabled Auto Respawn", "success"] call Vortex_fnc_notification_system;
} else {
    AutoSpawn = false;
    player setVariable["AutoSpawn", false];
    ["Disabled Auto Respawn", "error"] call Vortex_fnc_notification_system;
};
if (player distance activeFlag > 8) then {
    1 cutText["", "PLAIN"];
    player setVariable["ameinnehmen", false];
    playsound "additemfailed";
    ["You moved over 8 meters away from the flag and capturing failed!", "error", 5] call Vortex_fnc_notification_system;
};
if (!(alive player)) then {
    1 cutText["", "PLAIN"];
    player setVariable["ameinnehmen", false];
    playsound "additemfailed";
    ["You died and capturing failed!", "error", 5] call Vortex_fnc_notification_system;
};
if (player != vehicle player) then {
    1 cutText["", "PLAIN"];
    player setVariable["ameinnehmen", false];
    playsound "additemfailed";
    ["You have entered a vehicle and capturing failed!", "error", 5] call Vortex_fnc_notification_system;
};
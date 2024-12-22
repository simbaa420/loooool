LastSpawn = "None";
InSafeZone = true;
InVehicleSafeZone = false;
Old_Vehicle_Spawned = "";
RandomSkin = 0;
nameTagsObj = [];
Killstreak = 0;
KillfeedControl = 0;
KillfeedList = [];
player setVariable["EventPoints", 0];
player setVariable["SpecialGear", false];
SpecialGearNumber = -1;
player setVariable["AutoSpawn", false];
AutoSpawn = false;
player setVariable["AutoVehicle", false];
AutoVehicle = false;
player setVariable["AdminMode", false];
AdminMode = false;
if ((getPlayerUID player) in call compile preprocessFileLineNumbers "ID\DonatorIDs.txt") then {
    player setVariable["DonatorRank", true];
} else {
    player setVariable["DonatorRank", false];
};
if ((getPlayerUID player) in call compile preprocessFileLineNumbers "ID\AdminIDs.txt") then {
    player setVariable["AdminRank", true];
} else {
    player setVariable["AdminRank", false];
};
if (isNil {
    profileNamespace getVariable "Global_Kills"
}) then {
    profileNamespace setVariable["Global_Kills", 0];
};
if (isNil {
    profileNamespace getVariable "Global_Deaths"
}) then {
    profileNamespace setVariable["Global_Deaths", 0];
};
if (isNil {
    profileNamespace getVariable "savedGear"
}) then {
    call Vortex_fnc_StartGear;
} else {
    call Vortex_fnc_loadGear;
};
if (isNil {
    profileNamespace getVariable "Money"
}) then {
    profileNamespace setVariable["Money", 0];
};
if (isNil {
    profileNamespace getVariable "Grass"
}) then {
    profileNamespace setVariable["Grass", false];
};
if (profileNamespace getVariable "Grass") then {} else {};
_plugvar = profileNamespace getVariable["Plugs", 1];
0 fadeSound _plugvar;
if (profileNamespace getVariable "BackpackAllowed") then {
    backpackvar = true;
    call Vortex_fnc_BackpackHandler;
};
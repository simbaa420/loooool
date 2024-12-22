if !(player getVariable "SpecialGear") then {
    private["_gearData"];
    _gearData = getUnitLoadout player;
    profileNamespace setVariable["savedGear", _gearData];
};
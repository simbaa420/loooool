private["_gearData"];
_gearData = profileNamespace getVariable["savedGear", []];
player setUnitLoadout _gearData;
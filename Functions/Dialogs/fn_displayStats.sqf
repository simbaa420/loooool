params["_mode", "_this"];
switch (_mode) do {
    case "onLoad":
        {
            private _display = findDisplay 60000;
            private _ctrlListNbox = _display displayCtrl 61000;
            _ctrlListNbox lnbAddRow["Name", "Score", "Kills", "Deaths", "KD"]; {
                private _name = format["%1", name _x];
                private _kills = format["%1", _x getVariable["Session_Kills", 0]];
                private _deaths = format["%1", _x getVariable["Session_Deaths", 0]];
                private _kd = format["%1", (((_x getVariable["Session_Kills", 1]) / (_x getVariable["Session_Deaths", 1])) toFixed 2)];
                private _score = format["%1", _x getVariable["EventPoints", 0]];
                private _index = _ctrlListNbox lnbAddRow[_name, _score, _kills, _deaths, _kd];
            }
            forEach playableUnits;
            _ctrlListNBox lnbSortByValue[0, true];
            _ctrlListNbox ctrlAddEventHandler["LBDblClick", {
                ["onLBDblClick", _this] call Vortex_fnc_displayStats;
            }];
        };
};
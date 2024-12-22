removeAllMissionEventHandlers "Draw3D";
addMissionEventHandler["Draw3D", {
    private _camASL = AGLtoASL positionCameratoWorld[0, 0, 0];
    private _draw = {
        params["_obj", "_player", "_height"];
        if (!isplayer _obj || {
            !lineIntersects[_camASL, AGLtoASL(_obj modeltoWorld[0, 0, _height]), vehicle player, _obj] && !lineIntersects[_camASL, AGLtoASL(_player modeltoWorld(_player selectionPosition "head")), vehicle player, _obj]
        }) then {
            _name = _player getVariable["NTVar_Name", name _player];
            _subText = _player getVariable["NTVar_SubTitle", "Fragger"];
            _colorTitle = _player getVariable["VortexVar_ColorName", [0.839, 0.651, 0.235, 1]];
            _distance = cameraOn distance _obj;
            _position = _player modeltoWorldVisual[0, 0, ((_player selectionPosition "head") select 2) + _height + (_distance / 10)];
            if (_subText isNotEqualTo "") then {
                drawIcon3D["", [1, 1, 1, 1], _position, 0, 2.5, 0, _subText, 2, 0.0325, "RobotoCondensed", "center"];
            };
            drawIcon3D["", _colorTitle, _position, 0, 1.3, 0, _name, 2, 0.034, "RobotoCondensedBold", "center"];
        };
    }; {
        if (_x isKindOf "Man") then {
            [_x, _x, 0.50] call _draw;
        } else {
            private _veh = _x; {
                [_veh, _x, 1.2] call _draw;
            }
            forEach(crew _x);
        };
    }
    forEach(((ASLtoAGL getPosASL cameraOn) nearEntities[["Man", "Car"], 10]) - [vehicle player]);
}];
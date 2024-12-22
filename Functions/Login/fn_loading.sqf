params[['_ctrl', controlNull, [controlNull, displayNull]], ['_text', 'Loading', ['']], ['_duration', 3, [0]], ['_customPicture', '\A3\Ui_f\data\IGUI\RscTitles\DirIndicator\dir_000_ca.paa', ['']]];
if (isNull _ctrl) exitWith {};
private _previousGroup = _ctrl getVariable['loadingBarGroup', controlNull];
if (!isNull _previousGroup) exitWith {
    ctrlDelete _previousGroup
};
if !(canSuspend) exitWith {
    systemChat 'ERROR: DT_fnc_loadingBar can only run scheduled (spawn)'
};
uiNamespace setVariable['loadingBarText', nil];
private _pW = parseNumber((pixelW * 5) toFixed 3);
private _pH = parseNumber((pixelH * 5) toFixed 3);
private _fontType = "PuristaMedium";
private _backgroundColor = [0, 0, 0, 0.6];
private _picSize = 24;
private _comma = '.';
private _display =
if (_ctrl isEqualType displayNull) then {
    _ctrl
} else {
    ctrlParent _ctrl
};
private _EHData = -1;
private _group =
switch (true) do {
    case (_ctrl isEqualType displayNull):
        {
            _EHData = _display displayAddEventHandler['KeyDown', {
                true
            }];
            private _group = _display ctrlCreate['RscControlsGroupNoScrollbars', -1];
            _group ctrlSetPosition[0 * safezoneW + safezoneX, 0 * safezoneH + safezoneY, 1 * safezoneW, 1 * safezoneH];
            _group ctrlCommit 0;
            _group
        };
    case (_ctrl isEqualType controlNull):
        {
            _ctrl ctrlEnable false;
            (ctrlPosition _ctrl) params['_cX', '_cY', '_cW', '_cH'];
            private _controlsGroupParent = ctrlParentControlsGroup _ctrl;
            private _group = controlNull;
            if (isNull _controlsGroupParent) then {
                _group = _display ctrlCreate['RscControlsGroupNoScrollbars', -1];
            } else {
                _group = _display ctrlCreate['RscControlsGroupNoScrollbars', -1, _controlsGroupParent];
            };
            _group ctrlSetPosition[_cX, _cY, _cW, _cH];
            _group ctrlCommit 0;
            _group
        };
}; _ctrl setVariable['loadingBarGroup', _group];
(ctrlPosition _group) params['_gX', '_gY', '_gW', '_gH'];
private _background = _display ctrlCreate['RscText', -1, _group];
_background ctrlSetPosition[0, 0, _gW, _gH];
_background ctrlSetBackGroundColor _backgroundColor;
_background ctrlCommit 0;
private _textCtrl = _display ctrlCreate['RscStructuredText', -1, _group];
_textCtrl ctrlSetPosition[0, _gH / 2 - (_picSize / 2 * _pH), _gW, 10 * _pH];
_textCtrl ctrlSetFont _fontType;
_textCtrl ctrlSetText "Loading";
_textCtrl ctrlSetBackGroundColor[0, 0, 0, 0];
_textCtrl ctrlCommit 0;
private _picture = _display ctrlCreate['RscPictureKeepAspect', -1, _group];
_picture ctrlSetPosition[_gW / 2 - (_picSize / 2 * _pW), _gH / 2, _picSize * _pW min _gW / 2, _picSize * _pH min _gH / 2];
_picture ctrlSetText _customPicture;
_picture ctrlCommit 0;
while {
    !isNull _group
}
do {
    _duration = _duration - 0.5;
    _comma = _comma + '.';
    if (count _comma >= 4) then {
        _comma = "."
    };
    _textCtrl ctrlSetStructuredText(parseText format["<t color='#FFFFFF' align='center' shadow='1' size='%3'>%1%2</t>", uiNamespace getVariable['loadingBarText', _text], _comma, 120 * _pH]);
    _picture ctrlSetAngle[((ctrlAngle _picture select 0) + 180), 0.5, 0.5, false];
    _picture ctrlCommit 0.5;
    uiSleep 0.5;
    if (_duration <= 0) exitWith {};
}; switch (true) do {
    case (_ctrl isEqualType displayNull):
        {
            _display displayRemoveEventHandler['KeyDown', _EHData];
        };
    case (_ctrl isEqualType controlNull):
        {
            _ctrl ctrlEnable true;
        };
}; ctrlDelete _group;
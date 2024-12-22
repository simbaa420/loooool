params[["_text", "", [""]], ["_notiftype", "success", ["", [], {}]], ["_speed", 5, [5]], ["_titleText", "Information", [""]]];
if (isDedicated || !hasInterface) exitWith {};
if (isNil "current_notifications") then {
    current_notifications = [];
};
disableSerialization;
private _display = findDisplay 46;
private _TitleColour =
switch (_notiftype) do {
    case "info":
        {
            [0.5333, 0, 1, 1];
        }; case "error":
            {
                [1, 0, 0, 1];
            };
        case "warning":
            {
                [1, 0.647, 0, 1];
            };
        case "success":
            {
                [0, 1, 0, 1];
            };
        case "donator":
            {
                [1, 1, 0, 1];
            };
        default {
            [0.5333, 0, 1, 1];
        };
}; if (_TitleColour isEqualTo "error") then {
    _titleText = "Error"
};
if (_TitleColour isEqualTo "success") then {
    _titleText = "Success"
};
if (_TitleColour isEqualTo "warning") then {
    _titleText = "Warning"
};
if (_TitleColour isEqualTo "donator") then {
    _titleText = "Donator"
};
playSound "HintExpand";
private _Title = _display ctrlCreate["RscText", -1];
_Title ctrlSetPosition[0.8035 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.002 * safezoneW, 0.015 * safezoneH];
_Title ctrlSetBackgroundColor _TitleColour;
_Title ctrlSetFade 1;
_Title ctrlCommit 0;
_Title ctrlSetFade 0;
_Title ctrlCommit 0.4;
private _Message = _display ctrlCreate["RscStructuredText", -1];
_Message ctrlSetStructuredText parseText format["<t size='1' color='#8800ff'>%2</t><br/><t size='0.8'>%1</t>", _text, _titleText];
_Message ctrlSetPosition[0.805 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.185 * safezoneW, 0.015 * safezoneH];
_Message ctrlCommit 0;
_Message ctrlSetPosition[0.805 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.185 * safezoneW, ((ctrlTextHeight _Message) + (0.005 * safezoneH))];
_Message ctrlCommit 0;
_Message ctrlSetBackgroundColor[0.12, 0.12, 0.12, 1];
_Message ctrlSetFade 1;
_Message ctrlCommit 0;
_Message ctrlSetFade 0;
_Message ctrlCommit 0.4;
_Title ctrlSetPosition[0.8035 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.002 * safezoneW, ((ctrlTextHeight _Message) + (0.005 * safezoneH))];
_Title ctrlCommit 0;
[_Message, _Title, _speed] spawn {
    disableSerialization;
    _this params["_message", "_title", "_sleepTimr"];
    uiSleep(_sleepTimr);
    _Message ctrlSetFade 1;
    _Message ctrlCommit 0.3;
    _Title ctrlSetFade 1;
    _Title ctrlCommit 0.3;
    uiSleep 0.35;
    ctrlDelete _Message;
    ctrlDelete _Title;
};
private _posMessage = (ctrlPosition(_Message)) select 1;
private _posTitle = (ctrlPosition(_Title)) select 1;
private _messageHigh = (ctrlPosition(_Message)) select 3;
if (count current_notifications >= 1) then {
    private _activeNotifications = 0; {
        _x params["_TitleCtrl", "_MessageCtrl"];
        if (!isNull _TitleCtrl && !isNull _MessageCtrl) then {
            _TitleCtrl ctrlSetPosition[0.8035 * safezoneW + safezoneX, (_posTitle + _messageHigh + 1.3 * (0.011 * safezoneH))];
            _MessageCtrl ctrlSetPosition[0.805 * safezoneW + safezoneX, (_posMessage + _messageHigh + 1.3 * (0.011 * safezoneH))];
            _TitleCtrl ctrlCommit 0.3;
            _MessageCtrl ctrlCommit 0.3;
            _posMessage = (_posMessage + _messageHigh + 1.3 * (0.011 * safezoneH));
            _posTitle = (_posTitle + _messageHigh + 1.3 * (0.011 * safezoneH));
            _messageHigh = (ctrlPosition(_MessageCtrl)) select 3;
            if (_activeNotifications > 3) then {
                _TitleCtrl ctrlSetFade 1;
                _MessageCtrl ctrlSetFade 1;
                _TitleCtrl ctrlCommit 0.25;
                _MessageCtrl ctrlCommit 0.25;
            };
        };
        _activeNotifications = _activeNotifications + 1;
    }
    forEach current_notifications;
};
current_notifications = ([
    [_Title, _Message]
] + current_notifications) select {
    !isNull(_x select 0) && !isNull(_x select 1)
};
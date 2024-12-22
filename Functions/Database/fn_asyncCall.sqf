params[["_mode", 0, [0]], ["_queryStmt", "", [""]], ["_multi", true, [true]]];
private _key = "extDB3"
callExtension format["%1:%2:%3", _mode, extDB_SQL_CUSTOM_ID, _queryStmt];
if (_mode isEqualTo 1) exitWith {
    true
};
private["_queryResult", "_loop"];
_key = parseSimpleArray _key;
_key = _key select 1;
_queryResult = "";
_loop = true;
while {
    _loop
}
do {
    _queryResult = "extDB3"
    callExtension format["4:%1", _key];
    if (_queryResult isEqualTo "[5]") then {
        _queryResult = "";
        while {
            true
        }
        do {
            _pipe = "extDB3"
            callExtension format["5:%1", _key];
            if (_pipe isEqualTo "") exitWith {
                _loop = false
            };
            _queryResult = _queryResult + _pipe;
        };
    } else {
        if (!(_queryResult isEqualTo "[3]")) then {
            _loop = false;
        };
    };
}; _queryResult = parseSimpleArray _queryResult;
if ((_queryResult select 0) isEqualTo 0) exitWith {
    diag_log format["extDB3: Protocol Error: %1", _queryResult];
    []
};
private _return = (_queryResult select 1);
if (!_multi) then {
    _return = _return select 0;
};
_return;
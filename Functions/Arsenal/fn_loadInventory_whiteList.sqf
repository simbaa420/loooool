#include "\A3\Ui_f\hpp\defineResinclDesign.inc"
#include "macros.hpp"
DEBUG("LoadInventory WhiteList");
# define DEFAULT_SLOT 0 # define MUZZLE_SLOT 101 # define OPTICS_SLOT 201 # define FLASHLIGHT_SLOT 301 # define FIRSTAIDKIT_SLOT 401 # define FINS_SLOT 501 # define BREATHINGBOMB_SLOT 601 # define NVG_SLOT 602 # define GOGGLE_SLOT 603 # define SCUBA_SLOT 604 # define HEADGEAR_SLOT 605 # define UNIFORM_SLOT 801 # define FACTOR_SLOT 607 # define HMD_SLOT 616 # define BINOCULAR_SLOT 617 # define MEDIKIT_SLOT 619 # define RADIO_SLOT 611 # define VEST_SLOT 701 # define BACKPACK_SLOT 901
scopeName "LARs_fnc_loadInventory_whiteList";
private["_cfg", "_inventory", "_isCfg", "_whiteList"];
_object = _this param[0, objNull, [objNull]];
_cfg = _this param[1, configFile, [configFile, "", []]];
_inventory = [];
private["_namespace", "_name", "_data", "_nameID"];
_namespace = _cfg param[0, missionNamespace, [missionNamespace, grpNull, objNull]];
_name = _cfg param[1, "", [""]];
_data = _namespace getVariable["bis_fnc_saveInventory_data", []];
_nameID = _data find _name;
if (_nameID >= 0) then {
    _inventory = _data select(_nameID + 1);
    _cfg = [_inventory];
} else {
    ["Inventory '%1' not found", _name] call BIS_fnc_error;
    breakOut "LARs_fnc_loadInventory_whiteList";
};
_whiteList = _this param[2, [], [
    []
]];
_msg = format["LoadInventory: WL: %1", _whiteList];
DEBUG(_msg);
if !(local _object) exitWith {
    [
        [_object, _cfg, _whiteList], "LARs_fnc_loadInventory_whiteList", _object] call BIS_fnc_MP;
    false
};
private["_vest", "_headgear", "_goggles"];
_vest = "";
_headgear = "";
_goggles = "";
_vest = _inventory select 1 select 0;
_headgear = _inventory select 3;
_goggles = _inventory select 4;
_linkedItemsMisc = [(_inventory select 9)];
if (!isNil {
    _inventory select 6 select 1
}) then {
    _linkedItemsMisc = _linkedItemsMisc + [_inventory select 6 select 1]
} else {
    _linkedItemsMisc = _linkedItemsMisc + [
        ["", "", ""]
    ];
};
if (!isNil {
    _inventory select 7 select 1
}) then {
    _linkedItemsMisc = _linkedItemsMisc + [_inventory select 7 select 1]
} else {
    _linkedItemsMisc = _linkedItemsMisc + [
        ["", "", ""]
    ];
};
if (!isNil {
    _inventory select 8 select 1
}) then {
    _linkedItemsMisc = _linkedItemsMisc + [_inventory select 8 select 1]
} else {
    _linkedItemsMisc = _linkedItemsMisc + [
        ["", "", ""]
    ];
};
removeUniform _object;
removeVest _object;
removeHeadgear _object;
removeGoggles _object;
removeBackpack _object;
removeAllItems _object;
removeAllAssignedItems _object;
removeAllWeapons _object;
_notification = "Certain items in the selected loadout<br />are not allowed and have been removed<br />";
_notAllowed = false;
_uniform = _inventory select 0 select 0;
if (_uniform != "") then {
    if (CONDITION(_uniform)) then {
        if (isClass(configFile >> "cfgWeapons" >> _uniform)) then {
            _object forceAddUniform _uniform;
        } else {
            ["Uniform '%1' does not exist in CfgWeapons", _uniform] call BIS_fnc_error;
        };
    } else {
        _notAllowed = true;
        _notification = format["%1<br />%2 - %3", _notification, "Uniform", _uniform];
    };
};
if (_vest != "") then {
    if (CONDITION(_vest)) then {
        if (isClass(configFile >> "cfgWeapons" >> _vest)) then {
            _object addVest _vest;
        } else {
            ["Vest '%1' does not exist in CfgWeapons", _vest] call BIS_fnc_error;
        };
    } else {
        _notAllowed = true;
        _notification = format["%1<br />%2 - %3", _notification, "Vest", _vest];
    };
};
if (_headgear != "") then {
    if (CONDITION(_headgear)) then {
        if (isClass(configFile >> "cfgWeapons" >> _headgear)) then {
            _object addHeadgear _headgear;
        } else {
            ["Headgear '%1' does not exist in CfgWeapons", _headgear] call BIS_fnc_error;
        };
    } else {
        _notAllowed = true;
        _notification = format["%1<br />%2 - %3", _notification, "Headgear", _headgear];
    };
};
if (_goggles != "") then {
    if (CONDITION(_goggles)) then {
        if (isClass(configFile >> "cfgGlasses" >> _goggles)) then {
            _object addGoggles _goggles;
        } else {
            ["Goggles '%1' does not exist in CfgGlasses", _goggles] call BIS_fnc_error;
        };
    } else {
        _notAllowed = true;
        _notification = format["%1<br />%2 - %3", _notification, "Goggles", _goggles];
    };
};
_backpack = _inventory select 2 select 0;
if (_backpack != "") then {
    if (CONDITION(_backpack)) then {
        if (isClass(configFile >> "cfgVehicles" >> _backpack)) then {
            _object addBackpack _backpack;
            clearAllItemsFromBackpack _object;
        } else {
            ["Backpack '%1' does not exist in CfgVehicles", _backpack] call BIS_fnc_error;
        };
    } else {
        _notAllowed = true;
        _notification = format["%1<br />%2 - %3", _notification, "Backpack", _backpack];
    };
}; {
    if (_x != "") then {
        if (CONDITION(_x)) then {} else {
            _notAllowed = true;
            _notification = format["%1<br />%2 - %3", _notification, "Magazine", _x];
        };
    };
}
forEach[_inventory select 6 select 2, _inventory select 7 select 2, _inventory select 8 select 2]; {
    if (_x != "") then {
        if (CONDITION(_x)) then {
            _object addWeapon _x;
        } else {
            _notAllowed = true;
            _notification = format["%1<br />%2 - %3", _notification, "Weapon", _x];
        };
    };
}
forEach[_inventory select 5, _inventory select 6 select 0, _inventory select 7 select 0, _inventory select 8 select 0]; {
    _weaponType = _forEachIndex; {
        if (_x != "") then {
            if (CONDITION(_x)) then {
                switch (_weaponType) do {
                    case 0:
                        {
                            _object linkItem _x;
                        };
                    case 1:
                        {
                            _object addPrimaryWeaponItem _x;
                        };
                    case 2:
                        {
                            _object addSecondaryWeaponItem _x;
                        };
                    case 3:
                        {
                            _object addHandgunItem _x;
                        };
                };
            } else {
                _notAllowed = true;
                _item = ["Item", "Primary Weapon Item", "Secondary Weapon Item", "Handgun Item"] select _weaponType;
                _notification = format["%1<br />%2 - %3", _notification, _item, _x];
            };
        };
    }
    forEach _x;
}
forEach _linkedItemsMisc; {
    if (CONDITION(_x)) then {
        _object addItemToUniform _x;
    } else {
        _notAllowed = true;
        _notification = format["%1<br />%2 - %3", _notification, "Uniform Item", _x];
    };
}
forEach(_inventory select 0 select 1); {
    if (CONDITION(_x)) then {
        _object addItemToVest _x;
    } else {
        _notAllowed = true;
        _notification = format["%1<br />%2 - %3", _notification, "Vest Item", _x];
    };
}
forEach(_inventory select 1 select 1); {
    if (CONDITION(_x)) then {
        _object addItemToBackpack _x;
    } else {
        _notAllowed = true;
        _notification = format["%1<br />%2 - %3", _notification, "Backpack Item", _x];
    };
}
forEach(_inventory select 2 select 1);
if (_notAllowed) then {
    _notification
} else {
    ""
};
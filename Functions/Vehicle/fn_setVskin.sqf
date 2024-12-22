private _Selectedskin = profileNamespace getVariable['ActiveSkin', ""];
private _randomSkin = selectRandom["Fade", "Silver", "Mirror", "BloodReflect", "BlueReflect", "SpaceGrey", "BlueMFade", "Lime", "Orange", "White", "Black", "JAK", "HyperBeast", "RetroWave", "PornHub", "WaterElement", "BattlEye", "PinkGlow", "CyanGlow", "EmeraldGlow", "Chrome", "Gold"];
private _vehicle = vehicle player;
private["_skinSet"];
_skinSet = false;
if (_Selectedskin isEqualTo "") then {
    _Selectedskin = _randomSkin
};
private _skin = [_Selectedskin, _randomSkin] select(RandomSkin isEqualTo 1);
if ((_vehicle iskindof "O_MRAP_02_F") && _skin isNotEqualTo "") then {
    private _pathSkin = getArray(missionConfigFile >> "Vortex_mrap2_skins" >> _skin >> "textures"); {
        _vehicle setObjectTextureGlobal[_forEachIndex, _x];
    }
    forEach _pathSkin;
    private _pathMaterial = getArray(missionConfigFile >> "Vortex_mrap2_skins" >> _skin >> "materials"); {
        _vehicle setObjectMaterialGlobal[_forEachIndex, _x];
    }
    forEach _pathMaterial;
};
if (_vehicle iskindof "C_Hatchback_01_sport_F" && !_skinSet) then {
    randomNumber = floor(random 2) + 1;
    switch (randomNumber) do {
        case 1:
            {
                _vehicle setObjectTextureGlobal[0, "images\Vehicles\ph.jpg"];
                _skinSet = true;
            };
        case 2:
            {
                _vehicle setObjectTextureGlobal[0, "images\Vehicles\space.jpg"];
                _skinSet = true;
            };
    };
};
if (_vehicle iskindof "O_T_LSV_02_unarmed_F" && !_skinSet) then {
    randomNumber = floor(random 1) + 1;
    switch (randomNumber) do {
        case 1:
            {
                _vehicle setObjectTextureGlobal[0, "images\Vehicles\TF0.jpg"];
                _vehicle setObjectTextureGlobal[1, "images\Vehicles\TF1.jpg"];
                _vehicle setObjectTextureGlobal[2, "images\Vehicles\TF2.jpg"];
                _skinSet = true;
            };
    };
};
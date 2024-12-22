life_pos_attach = [15136.862, 17227.086, 0];
life_pos_exist = true;
life_preview_light = "#lightpoint"
createVehicleLocal life_pos_attach;
life_preview_light setLightBrightness 0.5;
life_preview_light setLightColor[1, 1, 1];
life_preview_light setLightAmbient[1, 1, 1];
auto = "O_MRAP_02_F"
createVehicleLocal life_pos_attach;
auto setDir 133;
auto allowDamage false;
auto enableSimulation false;
life_preview_3D_vehicle_object = auto;
ctrlSetText[1200, "#(argb,512,512,1)r2t(rtt1,1.0)"];
life_preview_3D_vehicle_cam = "camera"
camCreate[15136.862, 17227.086, 0];
life_preview_3D_vehicle_cam cameraEffect["Internal", "BACK", "rtt1"];
life_preview_3D_vehicle_cam camSetFocus[-1, -1];
showCinemaBorder false;
life_preview_3D_vehicle_cam camCommit 0;
[] spawn {
    for "_i"
    from 0 to 1 step 0 do {
        waitUntil {
            !isNull auto
        };
        private _vehicle = auto;
        private _distanceCam = 2.75 * ([boundingBoxReal _vehicle select 0 select 0, boundingBoxReal _vehicle select 0 select 2] distance[boundingBoxReal _vehicle select 1 select 0, boundingBoxReal _vehicle select 1 select 2]);
        private _azimuthCam = 0;
        life_preview_3D_vehicle_cam camSetTarget _vehicle;
        life_preview_3D_vehicle_cam camSetPos(_vehicle modelToWorld[_distanceCam * sin _azimuthCam, _distanceCam * cos _azimuthCam, _distanceCam * 0.33]);
        life_preview_3D_vehicle_cam camCommit 0;
        for "_i"
        from 0 to 1 step 0 do {
            if (!(_vehicle isEqualTo _vehicle)) exitWith {};
            _azimuthCam = _azimuthCam + 1.00;
            life_preview_3D_vehicle_cam camSetPos(_vehicle modelToWorld[_distanceCam * sin _azimuthCam, _distanceCam * cos _azimuthCam, _distanceCam * 0.33]);
            life_preview_3D_vehicle_cam camCommit 0.05;
            life_preview_3D_vehicle_cam camSetFov 0.25;
            sleep 0.05;
        };
    };
};
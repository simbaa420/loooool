if (!isNull auto) then {
    deleteVehicle auto;
};
auto = objNull;
life_preview_3D_vehicle_cam cameraEffect["Terminate", "BACK"];
camDestroy life_preview_3D_vehicle_cam;
deleteVehicle life_preview_light;
life_preview_light = objNull;
life_preview_3D_vehicle_cam = objNull;
life_pos_exist = false;
life_pos_attach = [];
showChat true;
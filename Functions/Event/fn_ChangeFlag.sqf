FlagPoints = 0;
publicVariable "FlagPoints";
capturedname = "";
publicVariable "capturedname";
randomIndex = floor(random 3);
ConstructionPos = [11742.703, 9307.525, 0];
OGPos = [11211.054, 8713.806, 0];
OldWoodHousePos = [10702.47, 8967.273, 0];
switch (randomIndex) do {
    case 0:
        {
            posname = "Construction";
            activeMarker setMarkerPos ConstructionPos;
            activeMarker setMarkerText posname;
            activeFlag setPos ConstructionPos;
        };
    case 1:
        {
            posname = "OG";
            activeMarker setMarkerPos OGPos;
            activeMarker setMarkerText posname;
            activeFlag setPos OGPos;
        };
    case 2:
        {
            posname = "Old Wood House";
            activeMarker setMarkerPos OldWoodHousePos;
            activeMarker setMarkerText posname;
            activeFlag setPos OldWoodHousePos;
        };
};
[ format ["Flag has changed Position: %1!", posname], "info", 5, "Event Message"] remoteExec["Vortex_fnc_notification_system", 0];
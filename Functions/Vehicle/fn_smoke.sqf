private _vehicle = vehicle player;
if (_vehicle iskindof "O_MRAP_02_F") then {
    randomNumber = floor(random 5) + 1;
    switch (randomNumber) do {
        case 1:
            {
                _vehicle setVehicleAmmoDef 0;
            };
        case 2:
            {
                _vehicle setVehicleAmmoDef 0;
            };
        case 3:
            {
                _vehicle setVehicleAmmoDef 0.5;
                titleText["<t color='#ff0000' size='2'>! ALERT !</t><br/><t size='2'>You have got 1 smoke!</t>", "PLAIN", 0.2, false, true];
            };
        case 4:
            {
                _vehicle setVehicleAmmoDef 0;
            };
        case 5:
            {
                _vehicle setVehicleAmmoDef 0;
            };
    };
};
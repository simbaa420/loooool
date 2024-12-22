player setDamage 0;
Killstreak = Killstreak + 1;
for "_i"
from 0 to 3 do {
    playSound "hint"
}; if (Killstreak == 5) then {
    player setAnimSpeedCoef 1.1;
    format["Because of your killstreak of %1 you have recieved a speedboost!", Killstreak] call Vortex_fnc_notification_system;
};
((uiNamespace getVariable "Killstreak") displayCtrl 1000) ctrlSetText format["Killstreak: %1", Killstreak];
currentMoney = profileNamespace getVariable["Money", 0];
amountToAddbais = 1000;
if (killstreak >= 0) then {
    amountToAdd = 1000;
};
if (killstreak >= 5) then {
    amountToAdd = (amountToAddbais * 2);
};
if (killstreak >= 10) then {
    amountToAdd = (amountToAddbais * 3);
};
if (killstreak >= 15) then {
    amountToAdd = (amountToAddbais * 4);
};
if (killstreak >= 20) then {
    amountToAdd = (amountToAddbais * 5);
};
if (killstreak >= 25) then {
    amountToAdd = (amountToAddbais * 6);
};
if (killstreak >= 30) then {
    amountToAdd = (amountToAddbais * 7);
};
if (killstreak >= 35) then {
    amountToAdd = (amountToAddbais * 8);
};
if (killstreak >= 40) then {
    amountToAdd = (amountToAddbais * 9);
};
if (killstreak >= 45) then {
    amountToAdd = (amountToAddbais * 10);
};
newMoneyAmount = currentMoney + amountToAdd;
profileNamespace setVariable["Money", newMoneyAmount];
["Added $" + (str amountToAdd) + " to your bank account", "info"] call Vortex_fnc_notification_system;
1 cutRsc["Progress_Bar", "PLAIN"];
for "_i"
from 0 to 1 step 0.1 do {
    sleep 0.5;
    ((uiNamespace getVariable "ProgressBar") displayCtrl 1003) progressSetPosition _i;
}; sleep 1;
1 cutText["", "PLAIN"];
sleep 5;
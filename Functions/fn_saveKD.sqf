params["_mode"];
switch (_mode) do {
    case "Death":
        {
            private _sessionDeaths = player getVariable["Session_Deaths", 0];
            private _globalDeaths = profileNamespace getVariable["Global_Deaths", 0];
            player setVariable["Session_Deaths", (_sessionDeaths + 1), true];
            profileNamespace setVariable["Global_Deaths", (_globalDeaths + 1)];
        }; case "Kill":
            {
                private _sessionKills = player getVariable["Session_Kills", 0];
                private _globalkills = profileNamespace getVariable["Global_Kills", 0];
                player setVariable["Session_Kills", (_sessionKills + 1), true];
                profileNamespace setVariable["Global_Kills", (_globalkills + 1)];
            };
};
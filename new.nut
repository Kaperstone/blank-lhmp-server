local
	seconds_online = 0,
	weapons=[
		"Hands",
		"Boxer",
		"Knife",
		"Baseball",
		"Molotov",
		"Colt Detective Special",
		"S&W Model Magnum",
		"S&W Model 10 M&P",
		"Colt 1911",
		"Thomson 1928",
		"Pumping Shotgun",
		"Sawed-Off Shotgun",
		"US Rifle M1903 Springfield",
		"Mosin Nagant 1891/30",
		"Granadev",
		"Key",
		"Jar",
		"Flash-lamp",
		"Documents",
		"Iron staff",
		"Papers",
		"Dynamit",
		"Keys",
		"Safe-deposit key",
		"Crowbar",
		"Tickets",
		"Packet",
		"Prkno",
		"Bottle",
		"Small key",
		"Sword",
		"Dog head"
	];
function onServerInit() {
  print("Blank script loaded");
  serverSetGamemodeName("Blank Server");
}
function onServerExit() {
  print("Shutting down the server.");
}
function onPlayerSpawn(playerid) {
	playerSetPosition(playerid, -1985.966675, -5.037054, 4.284860);
}
function onPlayerConnect(playerid) {
	sendPlayerMessage(format("Welcome to %s",serverGetName()));
}
function onPlayerDisconnect(playerid) {

}
function onPlayerEnterVehicle(playerid,carid,seatid) {

}
function onPlayerExitVehicle(playerid,carid) {

}
function onPlayerIsKilled(playerid,killerid) {
    if(playerid!=killerid) {
    	sendAllMessage(format("Player %s has been killed by %s with %s", playerGetName(playerid), playerGetName(killerid), weapons[playerGetWeaponID()]);
    }
}
function onPlayerText(playerid,message) {
    sendAllMessage("<"+playerGetName(playerid)+"> "+message);
    return false;
}
function onPlayerCommand(playerid,command,params) {
    switch(command){
        case "me": {
					sendAllMessage(playerGetName(playerid)+" "+params);
        }
        case "pm": {
        	local data = split(params, " ");
        	targetid=data[0];
        	data[0]=null;
        	sendPlayerMessage(data[0], format("PM from %s[%d]: %s",playerGetName(data[0]), playerid, data));
        }
        case "get": {
        	local data = split(params, " ");
        	switch(data[0]) {
        		case "online": {
        			sendPlayerMessage(playerid, format("The server has been online for %d seconds", seconds_online));
        		}
        		case "players": {
        			sendPlayerMessage(playerid, format("There are %d players online", serverGetOnlinePlayers()));
        		}
        		default: {
        			sendPlayerMessage(playerid, format("Server Name: %s", serverGetName()));
        			sendPlayerMessage(playerid, format("Game Mode: %s", serverGetGamemodeName()));
        			sendPlayerMessage(playerid, format("Players: %d/%d", serverGetOnlinePlayers(), serverGetMaxPlayers()));
        		}
        	}
        }
    }
}
function onServerTickSecond(ticks) {
	seconds_online++;
}

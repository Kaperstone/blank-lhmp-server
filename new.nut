local seconds_online = 0;
function onServerInit() {
  print("Blank script loaded");
  serverSetGamemodeName("Blank Server");
}
function onServerExit() {
  print("Shutting down the server.");
}
function onPlayerSpawn(playerid) {

}
function onPlayerConnect(playerid) {
	sendPlayerMessage("Welcome to "+serverGetName());
}
function onPlayerDisconnect(playerid) {

}
function onPlayerEnterVehicle(playerid,carid,seatid) {

}
function onPlayerExitVehicle(playerid,carid) {

}
function onPlayerIsKilled(playerid,killerid) {
    if(playerid!=killerid) {
    	sendAllMessage("Player "+playerGetName(playerid)+"'s been killed by "+playerGetName(killerid)+".");
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
        	sendPlayerMessage(data[0],playerGetName(data[0])+": "+data);
        }
        case "get": {
        	switch(params) {
        		case "online": {
        			sendPlayerMessage(playerid,"The server has been online for "+seconds_online+" seconds");
        		}
        		case "players": {
        			sendPlayerMessage(plaerid,"There are "+serverGetOnlinePlayers()+" players online");
        		}
        		default: {
        			sendPlayerMessage(playerid,"Server Name: "+serverGetName());
        			sendPlayerMessage(playerid,"Game Mode: "+serverGetGamemodeName());
        			sendPlayerMessage(playerid,"Players: "+serverGetOnlinePlayers()+"/"+serverGetMaxPlayers);
        		}
        	}
        }
    }
}
function onServerTick(ticks) {

}
function onServerTickSecond(ticks) {
	seconds_online++;
}

#using scripts\codescripts\struct;

#using scripts\shared\callbacks_shared;
#using scripts\shared\system_shared;

#insert scripts\shared\shared.gsh;

#namespace clientids;

REGISTER_SYSTEM( "clientids", &__init__, undefined )
	
function __init__()
{
	callback::on_start_gametype( &init );
	callback::on_connect( &on_player_connect );
	callback::on_spawned( &main );
}

function init()
{
	level.clientid = 0;
}

function on_player_connect()
{
	self.clientid = matchRecordNewPlayer( self );
	if ( !isdefined( self.clientid ) || self.clientid == -1 )
	{
		self.clientid = level.clientid;
		level.clientid++;
	}
}

function main()
{
/*
playername
sessionteam
kills
deaths
assists
defends
plants
defuses
returns
captures
objtime
headshots
shotsmissed
score
*/
    while(1)
    {
        players = GetPlayers();
        foreach(player in players)
        {
            iPrintLn("Hello World!");
            iPrint("Player Name: ");
            iPrintLn(CodeGetClientField(player, "playername"));
            sprintf("Player Name: {}", CodeGetClientField(player, "playername"));
            iPrintLn(CodeGetClientField(player, "deaths"));
        }
    }
}
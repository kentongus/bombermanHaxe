package;

import bomberman.api.DiscordClient;
import bomberman.data.PlayerSettings;
import bomberman.game.PlayState;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		init();

		addChild(new FlxGame(0, 0, PlayState, 60, 60, true));
	}

	function init()
	{
		#if DISCORD_RPC
		DiscordClient.init();
		#end

		PlayerSettings.init();
	}
}
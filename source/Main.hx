package;

import bomberman.api.DiscordClient;
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
		DiscordClient.init();
	}
}
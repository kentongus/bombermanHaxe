package;

import bomberman.InitState;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();

		addChild(new FlxGame(0, 0, InitState, 60, 60, true));
	}
}
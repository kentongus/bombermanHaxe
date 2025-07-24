package bomberman.game;

import flixel.FlxState;

class PlayState extends FlxState {
	override public function create()
	{
		super.create();

		DiscordClient.changePresence({
			state: "test",
			details: "asiofjwirgh",
			activity: Playing,
		});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
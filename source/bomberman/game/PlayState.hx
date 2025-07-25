package bomberman.game;

class PlayState extends BaseState
{
	override public function create()
	{
		super.create();

		#if DISCORD_RPC
		DiscordClient.changePresence({
			state: "test",
			details: "asiofjwirgh",
			activity: Playing,
		});
		#end
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (controls.A)
			trace("Player 1 pressed the A button!");
		if (controls.B)
			trace("Player 1 pressed the B button!");
		if (controls.X)
			trace("Player 1 pressed the X button!");
		if (controls.Y)
			trace("Player 1 pressed the Y button!");
	}
}
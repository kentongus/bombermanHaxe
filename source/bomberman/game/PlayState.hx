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
			trace("pressed A button!");
		if (controls.B)
			trace("pressed B button!");
		if (controls.X)
			trace("pressed X button!");
		if (controls.Y)
			trace("pressed Y button!");
	}
}
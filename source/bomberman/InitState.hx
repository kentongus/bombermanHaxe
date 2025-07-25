package bomberman;

import bomberman.api.DiscordClient;
import bomberman.data.PlayerSettings;
import bomberman.game.PlayState;
import flixel.FlxState;

class InitState extends FlxState {

    public override function create() {
        super.create();

        #if DISCORD_RPC
		DiscordClient.init();
		#end

		PlayerSettings.init();

        FlxG.switchState(PlayState.new);
    }
}
package bomberman.api;

#if DISCORD_RPC
import hxdiscord_rpc.Discord;
import hxdiscord_rpc.Types;
import sys.thread.Thread;

class DiscordClient {
    static final clientID:String = "1397755818480373801";

	public static function init()
	{
        var handlers:DiscordEventHandlers = DiscordEventHandlers.create();
        handlers.ready = cpp.Function.fromStaticFunction(onReady);
        handlers.disconnected = cpp.Function.fromStaticFunction(onDisconnect);
        handlers.errored = cpp.Function.fromStaticFunction(onError);

        Discord.Initialize(clientID, cpp.RawPointer.addressOf(handlers), 1, null);

		Thread.create(discordRPCUpdate);
    }

    private static function discordRPCUpdate():Void {
        while (true) {
            #if DISCORD_DISABLE_IO_THREAD
            Discord.UpdateConnection();
            #end

            Discord.RunCallbacks();

            Sys.sleep(2);
        }
	}

    public static function onReady(request:cpp.RawConstPointer<DiscordUser>) {
        trace('[DISCORD] Successfully connected to user "${request[0].username}"!');
    }

    public static function onDisconnect(error:Int, message:cpp.ConstCharStar) {
        trace("[DISCORD] Disconnected from user");
    }

    public static function onError(error:Int, message:cpp.ConstCharStar) {
        throw '[DISCORD] AN ERROR OCURRED! (Error code: $error | Message: ${cast(message, String)})';
	}

	public static function changePresence(params:DiscordRPCParams)
	{
        var presence:DiscordRichPresence = DiscordRichPresence.create();

        presence.activityType = ActivityType.Playing;

        presence.state = cast(params.state, Null<String>) ?? "";
        presence.details = cast(params.details, Null<String>) ?? "";

        // The big image representing the game that appears on the RPC.
        // The text that appears when you hover over the RPC image.
        presence.largeImageText = "Bomberman Haxe";
        // The key name of the image inside the RPC assets.
        presence.largeImageKey = cast(params.largeImageKey, Null<String>) ?? "template";

        // A small icon that appears at the bottom right of the image of the RPC.
        // The text that appears when you hover over the RPC image.
        presence.smallImageText = cast(params.smallImageText, Null<String>) ?? "";
        // The key name of the image inside the RPC assets.
        presence.smallImageKey = cast(params.smallImageKey, Null<String>) ?? "";

		Discord.UpdatePresence(cpp.RawConstPointer.addressOf(presence));
    }

	public static function clearPresence()
		Discord.ClearPresence();

	public static function shutdown()
		Discord.Shutdown();
}

typedef DiscordRPCParams = {
    /**
     * The current state the player or what they're doing.
     */
    var state:String;

    /**
     * Details about the state.
     * 
     * TODO?: maybe put a better description to this.
     */
    var details:String;

    /**
     * What the user is doing.
     */
	var ?activity:ActivityType;

    /**
     * The image to display in the Discord RPC.
     * 
     * MUST BE THE KEY NAME OF THE IMAGE INSIDE THE RPC ASSETS!!!
     */
    var ?largeImageKey:String;

    /**
     * The image to display in the small icon at the bottom right of the large image.
     * 
     * MUST BE THE KEY NAME OF THE IMAGE INSIDE THE RPC ASSETS!!!
     */
    var ?smallImageKey:String;

    /**
     * A text describing what the small icon implies.
     */
    var ?smallImageText:String;
}
#end
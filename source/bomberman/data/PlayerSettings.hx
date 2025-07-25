package bomberman.data;

import bomberman.input.Controls;
import flixel.input.gamepad.FlxGamepad;
import flixel.util.FlxSignal.FlxTypedSignal;

class PlayerSettings {
    public static var numPlayers(default, null) = 0;

    public static var player1(default, null):PlayerSettings;
    public static var player2(default, null):PlayerSettings;
    public static var player3(default, null):PlayerSettings;
    public static var player4(default, null):PlayerSettings;
    public static var player5(default, null):PlayerSettings;
    public static var player6(default, null):PlayerSettings;
    public static var player7(default, null):PlayerSettings;
    public static var player8(default, null):PlayerSettings;

	public static var onPlayerAdd(default, null) = new FlxTypedSignal<PlayerSettings->Void>();
	public static var onPlayerRemove(default, null) = new FlxTypedSignal<PlayerSettings->Void>();

    public var id(default, null):Int;

    public var controls:Controls;

    function new(id:Int, scheme:KeyboardScheme) {
        this.id = id;
        this.controls = new Controls('player$id', scheme);
    }

    public function setKeyboardScheme(scheme)
        controls.setKeyboardScheme(scheme);

    public static function init() {
        if (player1 == null) {
            player1 = new PlayerSettings(0, Solo);
            numPlayers++;
        }

		FlxG.gamepads.deviceConnected.add(addGamepad);

		var numGamepads:Int = FlxG.gamepads.numActiveGamepads;
		if (numGamepads > 0)
		{
			for (i in 0...numGamepads)
			{
				if (i > 7)
					break;

				var gamepad:FlxGamepad = FlxG.gamepads.getByID(i);
				if (gamepad == null)
					throw 'Unexpected null gamepad. id: $i';

				addGamepad(gamepad);
			}
		}
	}

	static function addGamepad(gamepad:FlxGamepad):Void
	{
		trace('[CONTROLS] added new gamepad! | Gamepad id: ${gamepad.id} | Player id: ${gamepad.id + 1}');

		switch (gamepad.id)
		{
			case 0:
				if (player2 == null)
				{
					player2 = new PlayerSettings(1, None);
					player2.controls.addDefaultGamepad(gamepad.id);
					numPlayers++;
				}
			case 1:
				if (player3 == null)
				{
					player3 = new PlayerSettings(2, None);
					player3.controls.addDefaultGamepad(gamepad.id);
					numPlayers++;
				}
			case 2:
				if (player4 == null)
				{
					player4 = new PlayerSettings(3, None);
					player4.controls.addDefaultGamepad(gamepad.id);
					numPlayers++;
				}
			case 3:
				if (player5 == null)
				{
					player5 = new PlayerSettings(4, None);
					player5.controls.addDefaultGamepad(gamepad.id);
					numPlayers++;
				}
			case 4:
				if (player6 == null)
				{
					player6 = new PlayerSettings(2, None);
					player6.controls.addDefaultGamepad(gamepad.id);
					numPlayers++;
				}
			case 5:
				if (player7 == null)
				{
					player7 = new PlayerSettings(3, None);
					player7.controls.addDefaultGamepad(gamepad.id);
					numPlayers++;
				}
			case 6:
				if (player8 == null)
				{
					player8 = new PlayerSettings(4, None);
					player8.controls.addDefaultGamepad(gamepad.id);
					numPlayers++;
				}
        }
		/*
			Reflect.callMethod('player${gamepad.id + 1}', Reflect.field('player${gamepad.id + 1}.controls', "new"), [gamepad.id, None]);
			Reflect.callMethod('player${gamepad.id + 1}.controls', Reflect.field('player${gamepad.id + 1}.controls', "addDefaultGamepad"), [gamepad.id]);
        */
	}

	public static function get(id:Int):Null<PlayerSettings>
	{
		return switch (id)
		{
			case 0: player1;
			case 1: player2;
			case 2: player3;
			case 3: player4;
			case 4: player5;
			case 5: player6;
			case 6: player7;
			case 7: player8;
			default: null;
		};
	}

    public static function reset() {
        player1 = null;
        player2 = null;
        player3 = null;
        player4 = null;
		player5 = null;
		player6 = null;
		player7 = null;
		player8 = null;
        numPlayers = 0;
    }
}
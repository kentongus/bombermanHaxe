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

    public static var onPlayerAdd = new FlxTypedSignal<PlayerSettings -> Void>();
    public static var onPlayerRemove = new FlxTypedSignal<PlayerSettings -> Void>();

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

        //FlxG.gamepads.deviceConnected.add(addGamepad);

        /*
        var numGamepads = FlxG.gamepads.numActiveGamepads;
        if (numGamepads > 0) {
            var gamepad = FlxG.gamepads.getByID(0);
            if (gamepad == null)
                throw 'Unexpected null gamepad. id: 0';

            player1.controls.addDefaultGamepad(0);
        }
        if (numGamepads > 0) {
            for (i in 1...numGamepads) {
                if (i > 7) break;

                Reflect.callMethod('player$i', Reflect.field('player$i.controls', "new"), [i, None]);
                numPlayers++;

                var gamepad = FlxG.gamepads.getByID(i);
                if (gamepad == null)
                    throw 'Unexpected null gamepad. id: $i';

                Reflect.callMethod('player${i + 1}.controls', Reflect.field('player${i + 1}.controls', "addDefaultGamepad"), [i]);
            }
        }
        */
    }

    static function addGamepad(gamepad:FlxGamepad) {}

    public static function reset() {
        player1 = null;
        player2 = null;
        player3 = null;
        player4 = null;
        numPlayers = 0;
    }
}
package bomberman.ui;

import bomberman.data.PlayerSettings;
import bomberman.input.Controls;
import flixel.FlxState;

class BaseState extends FlxState {
	public var controls(get, never):Controls;

	inline function get_controls():Controls
        return PlayerSettings.player1.controls;

    public function new() {
        super();
    }
}
package bomberman.input;

import flixel.input.FlxInput.FlxInputState;
import flixel.input.actions.FlxAction.FlxActionAnalog;
import flixel.input.actions.FlxAction.FlxActionDigital;
import flixel.input.actions.FlxActionInput;
import flixel.input.actions.FlxActionManager;
import flixel.input.actions.FlxActionSet;
import flixel.input.gamepad.FlxGamepad.FlxGamepadModel;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.keyboard.FlxKey;

enum abstract Action(String) to String from String
{
	var LEFT = "left";
	var DOWN = "down";
	var UP = "up";
	var RIGHT = "right";
	var LEFT_HOLD = "left-hold";
	var DOWN_HOLD = "down-hold";
	var UP_HOLD = "up-hold";
	var RIGHT_HOLD = "right-hold";
	var LEFT_RELEASE = "left-release";
	var DOWN_RELEASE = "down-release";
	var UP_RELEASE = "up-release";
	var RIGHT_RELEASE = "right-release";

	/**
	 * On PlayStation controllers (dualshocks), A is the Circle button
	 */
	var A = "a";

	/**
	 * On PlayStation controllers (dualshocks), B is the X button
	 */
	var B = "b";

	/**
	 * On PlayStation controllers (dualshocks), X is the Square button
	 */
	var X = "x";

	/**
	 * On PlayStation controllers (dualshocks), Y is the Triangle button
	 */
	var Y = "y";

	var A_HOLD = "a-hold";
	var B_HOLD = "b-hold";
	var X_HOLD = "x-hold";
	var Y_HOLD = "y-hold";
	var A_RELEASE = "a-release";
	var B_RELEASE = "b-release";
	var X_RELEASE = "x-release";
	var Y_RELEASE = "y-release";
	var START = "start";
	var MENU = "menu";
}

class Controls extends FlxActionSet {
	var _left = new FlxActionDigital(Action.LEFT);
	var _leftH = new FlxActionDigital(Action.LEFT_HOLD);
	var _leftR = new FlxActionDigital(Action.LEFT_RELEASE);
	var _down = new FlxActionDigital(Action.DOWN);
	var _downH = new FlxActionDigital(Action.DOWN_HOLD);
	var _downR = new FlxActionDigital(Action.DOWN_RELEASE);
	var _up = new FlxActionDigital(Action.UP);
	var _upH = new FlxActionDigital(Action.UP_HOLD);
	var _upR = new FlxActionDigital(Action.UP_RELEASE);
	var _right = new FlxActionDigital(Action.RIGHT);
	var _rightH = new FlxActionDigital(Action.RIGHT_HOLD);
	var _rightR = new FlxActionDigital(Action.RIGHT_RELEASE);
	var _a = new FlxActionDigital(Action.A);
	var _aH = new FlxActionDigital(Action.A_HOLD);
	var _aR = new FlxActionDigital(Action.A_RELEASE);
	var _b = new FlxActionDigital(Action.B);
	var _bH = new FlxActionDigital(Action.B_HOLD);
	var _bR = new FlxActionDigital(Action.B_RELEASE);
	var _x = new FlxActionDigital(Action.X);
	var _xH = new FlxActionDigital(Action.X_HOLD);
	var _xR = new FlxActionDigital(Action.X_RELEASE);
	var _y = new FlxActionDigital(Action.Y);
	var _yH = new FlxActionDigital(Action.Y_HOLD);
	var _yR = new FlxActionDigital(Action.Y_RELEASE);
	var _start = new FlxActionDigital(Action.START);
	var _menu = new FlxActionDigital(Action.MENU);

	public var byName:Map<String, FlxActionDigital> = new Map<String, FlxActionDigital>();
	public var gamepadsAdded:Array<Int> = [];
	public var keyboardScheme:KeyboardScheme = KeyboardScheme.None;

	public var LEFT(get, never):Bool;

	inline function get_LEFT():Bool
		return _left.check();

	public var LEFT_HOLD(get, never):Bool;

	inline function get_LEFT_HOLD():Bool
		return _leftH.check();

	public var LEFT_RELEASE(get, never):Bool;

	inline function get_LEFT_RELEASE():Bool
		return _leftR.check();

	public var DOWN(get, never):Bool;

	inline function get_DOWN():Bool
		return _down.check();

	public var DOWN_HOLD(get, never):Bool;

	inline function get_DOWN_HOLD():Bool
		return _downH.check();

	public var DOWN_RELEASE(get, never):Bool;

	inline function get_DOWN_RELEASE():Bool
		return _downR.check();

	public var UP(get, never):Bool;

	inline function get_UP():Bool
		return _up.check();

	public var UP_HOLD(get, never):Bool;

	inline function get_UP_HOLD():Bool
		return _upH.check();

	public var UP_RELEASE(get, never):Bool;

	inline function get_UP_RELEASE():Bool
		return _upR.check();

	public var RIGHT(get, never):Bool;

	inline function get_RIGHT():Bool
		return _right.check();

	public var RIGHT_HOLD(get, never):Bool;

	inline function get_RIGHT_HOLD():Bool
		return _rightH.check();

	public var RIGHT_RELEASE(get, never):Bool;

	inline function get_RIGHT_RELEASE():Bool
		return _rightR.check();

	public var A(get, never):Bool;

	inline function get_A():Bool
		return _a.check();

	public var A_HOLD(get, never):Bool;

	inline function get_A_HOLD():Bool
		return _aH.check();

	public var A_RELEASE(get, never):Bool;

	inline function get_A_RELEASE():Bool
		return _aR.check();

	public var B(get, never):Bool;

	inline function get_B():Bool
		return _b.check();

	public var B_HOLD(get, never):Bool;

	inline function get_B_HOLD():Bool
		return _bH.check();

	public var B_RELEASE(get, never):Bool;

	inline function get_B_RELEASE():Bool
		return _bR.check();

	public var X(get, never):Bool;

	inline function get_X():Bool
		return _x.check();

	public var X_HOLD(get, never):Bool;

	inline function get_X_HOLD():Bool
		return _xH.check();

	public var X_RELEASE(get, never):Bool;

	inline function get_X_RELEASE():Bool
		return _xR.check();

	public var Y(get, never):Bool;

	inline function get_Y():Bool
		return _y.check();

	public var Y_HOLD(get, never):Bool;

	inline function get_Y_HOLD():Bool
		return _yH.check();

	public var Y_RELEASE(get, never):Bool;

	inline function get_Y_RELEASE():Bool
		return _yR.check();

	public var START(get, never):Bool;

	inline function get_START():Bool
		return _start.check();

	public var MENU(get, never):Bool;

	inline function get_MENU():Bool
		return _menu.check();

	public function new(name:String, ?scheme:KeyboardScheme)
	{
        super(name);
		add(_left);
		add(_leftH);
		add(_leftR);
		add(_down);
		add(_downH);
		add(_downR);
		add(_up);
		add(_upH);
		add(_upR);
		add(_right);
		add(_rightH);
		add(_rightR);
		add(_a);
		add(_aH);
		add(_aR);
		add(_b);
		add(_bH);
		add(_bR);
		add(_x);
		add(_xH);
		add(_xR);
		add(_y);
		add(_yH);
		add(_yR);
		add(_start);
		add(_menu);

		for (dAction in digitalActions)
		{
			byName[dAction.name] = dAction;
		}

		setKeyboardScheme(scheme ?? None, false);
	}

	override function update()
	{
		super.update();
	}

	public function check(name:Action):Bool
	{
		if (!byName.exists(name))
			throw '[CONTROLS] Invalid name: $name';

		var action:FlxActionDigital = byName[name];
		return action.check();
	}

	public function getKeysFromAction(name:Action):Array<FlxKey>
	{
		if (!byName.exists(name))
			throw '[CONTROLS] Invalid name: $name';

		var result:Array<FlxKey> = [];
		for (input in byName[name].inputs)
		{
			if (input.device == KEYBOARD)
				result.push(input.inputID);
		}
		return result;
	}

	public function getButtonsFromAction(name:Action):Array<FlxGamepadInputID>
	{
		if (!byName.exists(name))
			throw '[CONTROLS] Invalid name: $name';

		var result:Array<FlxGamepadInputID> = [];
		for (input in byName[name].inputs)
		{
			if (input.device == GAMEPAD)
				result.push(input.inputID);
		}
		return result;
	}

	public function getDialogueName(action:FlxActionDigital):String
	{
		var input = action.inputs[0];
		return switch (input.device)
		{
			case KEYBOARD: '${(input.inputID : FlxKey)}';
			case GAMEPAD: '${(input.inputID : FlxGamepadInputID)}';
			case device: throw 'Unhandled device: $device';
		}
	}

	public function getDialogueNameFromToken(token:String):String
	{
		return getDialogueName(getActionFromControl(Control.createByName(token.toUpperCase())));
	}

	public function getDialogueNameFromControl(control:Control):String
	{
		return getDialogueName(getActionFromControl(control));
	}

	public function getActionFromControl(control:Control):FlxActionDigital
	{
		return switch (control)
		{
			case LEFT: _left;
			case DOWN: _down;
			case UP: _up;
			case RIGHT: _right;
			case A: _a;
			case B: _b;
			case X: _x;
			case Y: _y;
			case START: _start;
			case MENU: _menu;
		}
	}

	static function init()
	{
		FlxG.inputs.addUniqueType(new FlxActionManager());
	}

	public function forEachBound(control:Control, func:FlxActionDigital->FlxInputState->Void)
	{
		switch (control)
		{
			case LEFT:
				func(_left, JUST_PRESSED);
				func(_leftH, PRESSED);
				func(_leftR, JUST_RELEASED);
			case DOWN:
				func(_down, JUST_PRESSED);
				func(_downH, PRESSED);
				func(_downR, JUST_RELEASED);
			case UP:
				func(_up, JUST_PRESSED);
				func(_upH, PRESSED);
				func(_upR, JUST_RELEASED);
			case RIGHT:
				func(_right, JUST_PRESSED);
				func(_rightH, PRESSED);
				func(_rightR, JUST_RELEASED);
			case A:
				func(_a, JUST_PRESSED);
				func(_aH, PRESSED);
				func(_aR, JUST_RELEASED);
			case B:
				func(_b, JUST_PRESSED);
				func(_bH, PRESSED);
				func(_bR, JUST_RELEASED);
			case X:
				func(_x, JUST_PRESSED);
				func(_xH, PRESSED);
				func(_xR, JUST_RELEASED);
			case Y:
				func(_y, JUST_PRESSED);
				func(_yH, PRESSED);
				func(_yR, JUST_RELEASED);
			case START:
				func(_start, JUST_PRESSED);
			case MENU:
				func(_menu, JUST_PRESSED);
		}
	}

	public function replaceBinding(control:Control, device:Device, toAdd:Int, toRemove:Int)
	{
		if (toAdd == toRemove)
			return;

		switch (device)
		{
			case Keys:
				forEachBound(control, function(action, state) replaceKey(action, toAdd, toRemove, state));
			case Gamepad(id):
				forEachBound(control, function(action, state) replaceButton(action, id, toAdd, toRemove, state));
		}
	}
	function replaceKey(action:FlxActionDigital, toAdd:FlxKey, toRemove:FlxKey, state:FlxInputState)
	{
		if (action.inputs.length == 0)
		{
			addKeys(action, [toAdd], state);
			return;
		}

		var hasReplaced:Bool = false;
		for (i in 0...action.inputs.length)
		{
			var input = action.inputs[i];
			if (input == null)
				continue;

			if (input.device == KEYBOARD && input.inputID == toRemove)
			{
				if (toAdd == FlxKey.NONE)
					action.inputs.remove(input);
				else
				{
					@:privateAccess
					action.inputs[i].inputID = toAdd;
				}
				hasReplaced = true;
			}
			else if (input.device == KEYBOARD && input.inputID == toAdd)
			{
				if (hasReplaced)
					action.inputs.remove(input);
				else
					hasReplaced = true;
			}
		}

		if (!hasReplaced)
			addKeys(action, [toAdd], state);
	}

	function replaceButton(action:FlxActionDigital, deviceID:Int, toAdd:FlxGamepadInputID, toRemove:FlxGamepadInputID, state:FlxInputState)
	{
		if (action.inputs.length == 0)
		{
			addButtons(action, [toAdd], state, deviceID);
			return;
		}

		var hasReplaced:Bool = false;
		for (i in 0...action.inputs.length)
		{
			var input = action.inputs[i];
			if (input == null)
				continue;

			if (isGamepad(input, deviceID) && input.inputID == toRemove)
			{
				@:privateAccess
				action.inputs[i].inputID = toAdd;
				hasReplaced = true;
			}
		}

		if (!hasReplaced)
			addButtons(action, [toAdd], state, deviceID);
	}

	public function copyFrom(controls:Controls, ?device:Device)
	{
		for (name in controls.byName.keys())
		{
			var action = controls.byName[name];
			for (input in action.inputs)
			{
				if (device == null || isDevice(input, device))
					byName[name].add(cast input);
			}
		}
		switch (device)
		{
			case null:
				for (gamepad in controls.gamepadsAdded)
					if (gamepadsAdded.indexOf(gamepad) == -1)
						gamepadsAdded.push(gamepad);
				mergeKeyboardScheme(controls.keyboardScheme);
			case Gamepad(id):
				gamepadsAdded.push(id);
			case Keys:
				mergeKeyboardScheme(controls.keyboardScheme);
		}
	}

	public function copyTo(controls:Controls, ?device:Device)
	{
		controls.copyFrom(this, device);
	}

	function mergeKeyboardScheme(scheme:KeyboardScheme)
	{
		if (scheme != None)
		{
			switch (keyboardScheme)
			{
				case None:
					keyboardScheme = scheme;
				default:
					keyboardScheme = Custom;
			}
		}
	}

	public function bindKeys(control:Control, keys:Array<FlxKey>)
		forEachBound(control, function(action, state) addKeys(action, keys, state));

	public function unbindKeys(control:Control, keys:Array<FlxKey>)
		forEachBound(control, function(action, _) removeKeys(action, keys));

	static function addKeys(action:FlxActionDigital, keys:Array<FlxKey>, state:FlxInputState)
	{
		for (key in keys)
		{
			if (key == FlxKey.NONE)
				continue;
			action.addKey(key, state);
		}
	}

	static function removeKeys(action:FlxActionDigital, keys:Array<FlxKey>)
	{
		var i = action.inputs.length;
		while (i-- > 0)
		{
			var input = action.inputs[i];
			if (input.device == KEYBOARD && keys.indexOf(cast input.inputID) != -1)
				action.remove(input);
		}
	}

	public function setKeyboardScheme(scheme:KeyboardScheme, reset:Bool = true)
	{
		if (reset)
			removeKeyboard();

		keyboardScheme = scheme;

		bindKeys(Control.LEFT, getDefaultKeybinds(scheme, Control.LEFT));
		bindKeys(Control.DOWN, getDefaultKeybinds(scheme, Control.DOWN));
		bindKeys(Control.UP, getDefaultKeybinds(scheme, Control.UP));
		bindKeys(Control.RIGHT, getDefaultKeybinds(scheme, Control.RIGHT));
		bindKeys(Control.A, getDefaultKeybinds(scheme, Control.A));
		bindKeys(Control.B, getDefaultKeybinds(scheme, Control.B));
		bindKeys(Control.X, getDefaultKeybinds(scheme, Control.X));
		bindKeys(Control.Y, getDefaultKeybinds(scheme, Control.Y));
		bindKeys(Control.START, getDefaultKeybinds(scheme, Control.START));
		bindKeys(Control.MENU, getDefaultKeybinds(scheme, Control.MENU));
	}

	function getDefaultKeybinds(scheme:KeyboardScheme, control:Control):Array<FlxKey>
	{
		switch (scheme)
		{
			case Solo:
				switch (control)
				{
					case LEFT: return [FlxKey.LEFT, FlxKey.A];
					case DOWN: return [FlxKey.DOWN, FlxKey.S];
					case UP: return [FlxKey.UP, FlxKey.W];
					case RIGHT: return [FlxKey.RIGHT, FlxKey.D];
					case A: return [FlxKey.Z, FlxKey.P];
					case B: return [FlxKey.X, FlxKey.O];
					case X: return [FlxKey.C, FlxKey.I];
					case Y: return [FlxKey.V, FlxKey.U];
					case START: return [FlxKey.ENTER];
					case MENU: return [FlxKey.BACKSPACE];
				}
			case Duo(true):
				switch (control)
				{
					case LEFT: return [FlxKey.LEFT];
					case DOWN: return [FlxKey.DOWN];
					case UP: return [FlxKey.UP];
					case RIGHT: return [FlxKey.RIGHT];
					case A: return [FlxKey.Z];
					case B: return [FlxKey.X];
					case X: return [FlxKey.C];
					case Y: return [FlxKey.V];
					case START: return [FlxKey.ENTER];
					case MENU: return [FlxKey.BACKSPACE];
				}
			case Duo(false):
				switch (control)
				{
					case LEFT: return [FlxKey.A];
					case DOWN: return [FlxKey.S];
					case UP: return [FlxKey.W];
					case RIGHT: return [FlxKey.D];
					case A: return [FlxKey.P];
					case B: return [FlxKey.O];
					case X: return [FlxKey.I];
					case Y: return [FlxKey.U];
					case START: return [];
					case MENU: return [];
				}
			default:
				// fallthrough
		}

		return [];
	}

	function removeKeyboard()
	{
		for (action in this.digitalActions)
		{
			var i = action.inputs.length;
			while (i-- > 0)
			{
				var input = action.inputs[i];
				if (input.device == KEYBOARD)
					action.remove(input);
			}
		}
	}

	inline function addGamepadLiteral(id:Int, ?buttonMap:Map<Control, Array<FlxGamepadInputID>>)
	{
		gamepadsAdded.push(id);

		for (control in buttonMap.keys())
			bindButtons(control, id, buttonMap[control]);
	}

	public function removeGamepad(deviceID:Int = FlxInputDeviceID.ALL)
	{
		for (action in this.digitalActions)
		{
			var i = action.inputs.length;
			while (i-- > 0)
			{
				var input = action.inputs[i];
				if (isGamepad(input, deviceID))
					action.remove(input);
			}
		}

		gamepadsAdded.remove(deviceID);
	}

	public function addDefaultGamepad(id:Int)
	{
		addGamepadLiteral(id, [
			Control.LEFT => getDefaultGamepadBinds(Control.LEFT),
			Control.DOWN => getDefaultGamepadBinds(Control.DOWN),
			Control.UP => getDefaultGamepadBinds(Control.UP),
			Control.RIGHT => getDefaultGamepadBinds(Control.RIGHT),
			Control.A => getDefaultGamepadBinds(Control.A),
			Control.B => getDefaultGamepadBinds(Control.B),
			Control.X => getDefaultGamepadBinds(Control.X),
			Control.Y => getDefaultGamepadBinds(Control.Y),
			Control.START => getDefaultGamepadBinds(Control.START),
			Control.MENU => getDefaultGamepadBinds(Control.MENU)
		]);
	}

	function getDefaultGamepadBinds(control:Control):Array<FlxGamepadInputID>
	{
		switch (control)
		{
			case LEFT:
				return [FlxGamepadInputID.DPAD_LEFT, FlxGamepadInputID.LEFT_STICK_DIGITAL_LEFT];
			case DOWN:
				return [FlxGamepadInputID.DPAD_DOWN, FlxGamepadInputID.LEFT_STICK_DIGITAL_DOWN];
			case UP:
				return [FlxGamepadInputID.DPAD_UP, FlxGamepadInputID.LEFT_STICK_DIGITAL_UP];
			case RIGHT:
				return [FlxGamepadInputID.DPAD_RIGHT, FlxGamepadInputID.LEFT_STICK_DIGITAL_RIGHT];
			case A:
				return [#if switch FlxGamepadInputID.B #else FlxGamepadInputID.A #end];
			case B:
				return [#if switch FlxGamepadInputID.A #else FlxGamepadInputID.B #end];
			case X:
				return [#if switch FlxGamepadInputID.Y #else FlxGamepadInputID.X #end];
			case Y:
				return [#if switch FlxGamepadInputID.X #else FlxGamepadInputID.Y #end];
			case START:
				return [FlxGamepadInputID.START];
			case MENU:
				return [FlxGamepadInputID.CANCEL];
		}
	}

	public function bindButtons(control:Control, id:Int, buttons:Array<FlxGamepadInputID>)
		forEachBound(control, function(action, state) addButtons(action, buttons, state, id));

	public function unbindButtons(control:Control, id:Int, buttons:Array<FlxGamepadInputID>)
		forEachBound(control, function(action, _) removeButtons(action, id, buttons));

	static function addButtons(action:FlxActionDigital, buttons:Array<FlxGamepadInputID>, state:FlxInputState, id:Int)
	{
		for (button in buttons)
		{
			if (button == FlxGamepadInputID.NONE)
				continue;
			action.addGamepad(button, state, id);
		}
	}

	static function removeButtons(action:FlxActionDigital, gamepadID:Int, buttons:Array<FlxGamepadInputID>)
	{
		var i = action.inputs.length;
		while (i-- > 0)
		{
			var input = action.inputs[i];
			if (isGamepad(input, gamepadID) && buttons.indexOf(cast input.inputID) != -1)
				action.remove(input);
		}
	}

	public function getInputsFor(control:Control, device:Device, ?list:Array<Int>):Array<Int>
	{
		if (list == null)
			list = [];

		switch (device)
		{
			case Keys:
				for (input in getActionFromControl(control).inputs)
				{
					if (input.device == KEYBOARD)
						list.push(input.inputID);
				}
			case Gamepad(id):
				for (input in getActionFromControl(control).inputs)
				{
					if (isGamepad(input, id))
						list.push(input.inputID);
				}
		}

		return list;
	}

	public function removeDevice(device:Device)
	{
		switch (device)
		{
			case Keys:
				setKeyboardScheme(None);
			case Gamepad(id):
				removeGamepad(id);
		}
	}

	static function isDevice(input:FlxActionInput, device:Device):Bool
	{
		return switch (device)
		{
			case Keys: input.device == KEYBOARD;
			case Gamepad(id): isGamepad(input, id);
		}
	}

	static function isGamepad(input:FlxActionInput, deviceID:Int):Bool
	{
		return input.device == GAMEPAD && (deviceID == FlxInputDeviceID.ALL || input.deviceID == deviceID);
	}
}

enum Control
{
	LEFT;
	DOWN;
	UP;
	RIGHT;
	A;
	B;
	X;
	Y;
	START;
	MENU;
}

enum Device
{
	Keys;
	Gamepad(id:Int);
}

enum KeyboardScheme
{
	Solo;
	Duo(first:Bool);
	Custom;
	None;
}
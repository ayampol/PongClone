package source;

import flixel.FlxSprite;
import flixel.util.FlxColor; 
import flixel.FlxG;
import flixel.util.FlxAngle;
import flixel.FlxObject;



class PlayerPaddle extends FlxSprite
{
	public var speed:Float = 250;

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		this.immovable = true;
		makeGraphic(8, 32, FlxColor.BLUE);
		
		drag.x = drag.y = 1600;
		setSize(8, 32);
		offset.set(4, 2);
	}
	
	private function movement():Void
	{
		var _up:Bool = false;
		var _down:Bool = false;
		
		_up = FlxG.keys.anyPressed(["UP", "W"]);
		_down = FlxG.keys.anyPressed(["DOWN", "S"]);
		
		if (_up && _down)
			_up = _down = false;
			
		if ( _up || _down)
		{
			var mA:Float = 0;
			
			if (_up)
					mA = -90;
			else if (_down)
					mA = 90;
					
			//Determine velocity
			FlxAngle.rotatePoint(speed, 0, 0, 0, mA, velocity);
		
		}
		

	}
		
	override public function update():Void
	{
		movement();
		super.update();
	}
}
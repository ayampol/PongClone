package source;

import flixel.FlxSprite;
import flixel.util.FlxColor; 
import flixel.FlxG;
import flixel.util.FlxAngle;
import flixel.FlxObject;
import flixel.util.FlxPoint;



class EnemyPaddle extends FlxSprite
{
	public var speed:Float = 250;
	
	public var ballpos(default, null):FlxPoint;
	

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(8, 32, FlxColor.BLUE);
		
		drag.x = drag.y = 1600;
		setSize(8, 32);
		offset.set(4, 2);
		ballpos = FlxPoint.get();
	}
	
	
	private function movement():Void
	{		
		var mA:Float = 0;
		
		if (this.y < ballpos.y)
		{
			mA = 90;
		}
		else if (this.y > ballpos.y)
		{
			mA = -90;
		}
	
		//Determine velocity
		FlxAngle.rotatePoint(speed, 0, 0, 0, mA, velocity);
		

	}
		
	override public function update():Void
	{
		movement();
		super.update();
	}
}
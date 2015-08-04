package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxAngle;
import flixel.util.FlxMath;
import flixel.FlxG;

/**
 * ...
 * @author Alena
 */
class Ball extends FlxSprite
{
	public var speed:Float = 200;
	public var currentangle:Int;
	
	private var _collided:Bool = false;
	private var collisiondebouce:Int = 0;
	private var lastcollision:Int = 0;
	
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		
		this.elasticity = 1;
		
		var startangle = Math.floor(Math.random() * 90) + 135;
			
		currentangle = startangle;
		
		
		makeGraphic(12, 12, FlxColor.RED);
		
		drag.x = drag.y = 1200;
		setSize(16, 16);
		offset.set(4, 2);
		
		FlxAngle.rotatePoint(speed, 0, 0, 0, startangle, velocity);
	}
	
	
	public function paddle_collision(thiscollision:Int ):Void
	{
		
	if (collisiondebouce == 0 || lastcollision != thiscollision)
	{//New collision detected
		_collided = true;
		collisiondebouce++;
	}
	else { //Same collision detected
		_collided = false;
		collisiondebouce = 0;
	}
	
	lastcollision = thiscollision;
	
	}
	
/*	private function movement():Void
	{	
		
		if (_collided)
		{
			currentangle = currentangle + 180;
		}
		
		_collided = false;
		
		FlxAngle.rotatePoint(speed, 0, 0, 0, currentangle, velocity);
		
	}*/
	
	override public function update():Void
	{
		//movement();
		super.update();
	}
}
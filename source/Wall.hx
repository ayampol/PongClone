package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxSpriteUtil;
import flixel.FlxG;

/**
 * ...
 * @author Alena
 */
class Wall extends FlxSprite
{
	private var isBounceable:Bool;
	
	
	public function new(X:Float = 0, Y:Float = 0, Side:Bool) 
	{
		this.immovable = true;
		
		super(X, Y);
		if (Side)
		{
			makeGraphic(10, 480, FlxColor.GREEN);
			
			drag.x = drag.y = 1200;
			setSize(10, 480);
			offset.set(10, 480);
			
			isBounceable = false;
		}
		else
		{
			makeGraphic(640, 10, FlxColor.YELLOW);
			
			drag.x = drag.y = 1200;
			setSize(640, 10);
			offset.set(640, 10);
			
			isBounceable = true;
		}
	}
}
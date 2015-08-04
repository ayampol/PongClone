package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.group.FlxGroup;
import flixel.util.FlxMath;
import source.PlayerPaddle;
import flixel.util.FlxDestroyUtil;
import Ball;
import source.EnemyPaddle;
import flixel.FlxSprite;
import flixel.util.FlxRandom;


using flixel.util.FlxSpriteUtil;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var _btnPlay:FlxButton;
	private var _btnLookAtMe:FlxButton;
	
	private var _player:PlayerPaddle;
	private var _ball:Ball;
	private var _enemy:EnemyPaddle;
	
	private var _leftwall:Wall;
	private var _rightwall:Wall;
	private var _topwall:Wall;
	private var _bottomwall:Wall;
	
	private var BounceWalls:FlxGroup;
	
	//DEBUG BITS
	private var _DEBUG_bally:FlxText;
	private var _DEBUG_ballx:FlxText;
	
	private var stringy_bally:String;
	private var stringy_ballx:String;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.mouse.visible = false;
		
		
		_DEBUG_bally = new FlxText(0, 0, 100, Std.string(_ball.velocity.y));
		_DEBUG_ballx = new FlxText(0, 100, 100, Std.string(_ball.velocity.x));
		_player = new PlayerPaddle(30, 20);
		_enemy = new EnemyPaddle(610, 20);
		_ball = new Ball(240, 160);
		
		_leftwall = new Wall(5, 480, true);
		_rightwall = new Wall(645, 480, true);
		
		_topwall = new Wall(640, 5, false);
		_bottomwall = new Wall(640, 485, false);
		
		add(_DEBUG_bally);
		add(_DEBUG_ballx);
		add(_player);
		add(_enemy);
		add(_ball);
		add(_leftwall);
		add(_rightwall);
		add(_topwall);
		add(_bottomwall);
		
		BounceWalls.add(_topwall);
		BounceWalls.add(_bottomwall);
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		_btnPlay = FlxDestroyUtil.destroy(_btnPlay);
		_player.destroy();
		_enemy.destroy();
		_ball.destroy();
		_leftwall.destroy();
		_rightwall.destroy();
		_topwall.destroy();
		_bottomwall.destroy();
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
	stringy_bally = Std.string(_ball.velocity.y);
	stringy_ballx = Std.string(_ball.velocity.x);
	
		//_DEBUG_bally.text
		//Update ball velocity displayed
		_DEBUG_bally.text(stringy_bally);
		_DEBUG_ballx.text(stringy_ballx);
		
		updateBallPosition(_enemy);
		FlxG.collide(_ball, BounceWalls);
		FlxG.collide(_player, _ball);
		FlxG.collide(_enemy, _ball);
		super.update();
	}	
	
	public function hitwall(B:Ball, W:Wall):Void
	{
		var SideWin:Bool = true;
		
		_btnLookAtMe = new FlxButton(320, 240, "A Wall Was Hit!!!!");
		
		/*if (SideWin)	
		{	//PlayerWin
			_btnPlay = new FlxButton(0, 0, "You Won, Play again?", clickPlay);
			add(_btnPlay);
			_btnPlay.screenCenter();
		}
		else	
		{	//CompWin
			_btnPlay = new FlxButton(0, 0, "You Lost, Play again?", clickPlay);
			add(_btnPlay);
			_btnPlay.screenCenter();
		}*/
	}
	
	private function clickPlay():Void
	{
		FlxG.switchState(new MenuState());
	}
	
	private function updateBallPosition(e:EnemyPaddle):Void
	{
		e.ballpos.copyFrom(_ball.getMidpoint());
	}
	
	private function ping(Bat:FlxSprite, aBall:FlxSprite):Void
	{
		var batmid:Int = Std.int(Bat.y) + 16;
		var ballmid:Int = Std.int(aBall.y) + 8;
		var diff:Int;
		
		if (ballmid < batmid)
		{
			// Ball is on the top of the paddle
			diff = batmid - ballmid;
			aBall.velocity.y = ( -10 * diff);
			aBall.velocity.x = ( -10 * diff);
		}
		else if (ballmid > batmid)
		{
			// Ball on the bottom of the paddle
			diff = ballmid - batmid;
			aBall.velocity.y = (10 * diff);
			aBall.velocity.x = ( -10 * diff);
		}
		else
		{
			// Ball is perfectly mid-paddle
			aBall.velocity.y = 2 + FlxRandom.intRanged(0, 8);
		}
	}

	
}
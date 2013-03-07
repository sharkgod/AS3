package  
{
	import flash.display.ActionScriptVersion;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import spark.core.SpriteVisualElement;
	/**
	 * ...
	 * @author Leo Wu
	 */
	public class BallController extends SpriteVisualElement
	{
		
		protected var _gravity:Number;
		protected var _friction:Number;
		protected var _spring:Number;
		
		protected var _balls:Array;
		protected var _num:uint;
		protected var _length:uint;
		
		public function BallController() 
		{
			this._gravity = 1;
			this._friction = 0.98;
			this._spring = 0.01;
			
			this._balls = [];
			this._num = 1;
			this._length = 200;
			
			for ( var i:uint = 0, len:uint = this._num; i < len; i++ ) {
				var ball:Ball = new Ball( 20, 0xFF6644 );
				ball.x = 100;
				ball.y = 10 + i * this._length;
				this._balls.push( ball );
				
				this.addChild( ball );
			}

			this.addEventListener( Event.ENTER_FRAME, this.onControllerHandler );
		}
		
		protected function moveBall( ball:Ball, targetX:Number, targetY:Number ):void {
			ball.vx += ( targetX - ball.x ) * this._spring;
			ball.vy += ( targetY - ball.y ) * this._spring + this._gravity;
			
			ball.vx *= this._friction;
			ball.vy *= this._friction;
			
			ball.x += ball.vx;
			ball.y += ball.vy;
			
			this.graphics.lineStyle( 0x000000 );
			this.graphics.moveTo( targetX, targetY );
			this.graphics.lineTo( ball.x, ball.y );
			this.graphics.endFill();
		}
		
		protected function onControllerHandler( evt:Event ):void {
			this.graphics.clear();
			
			for ( var i:uint = 0, len:uint = this._balls.length; i < len; i++ ) {
				if ( i == 0 ) {
					this.moveBall( this._balls[i], this.mouseX, this.mouseY );
				}
				else {
					var prevBall:Ball = this._balls[i - 1];
					this.moveBall( this._balls[i], prevBall.x, prevBall.y );
				}
			}
			
			/*
			this.ball.vx += ( this.mouseX - this.ball.x ) * this._spring;
			this.ball.vy += ( this.mouseY - this.ball.y ) * this._spring + this._gravity;
			
			this.ball.vx *= this._friction;
			this.ball.vy *= this._friction;
			
			this.ball.x += this.ball.vx;
			this.ball.y += this.ball.vy;
			
			this.graphics.clear();
			this.graphics.lineStyle( 0x000000 );
			this.graphics.moveTo( this.mouseX, this.mouseY );
			this.graphics.lineTo( this.ball.x, this.ball.y );
			this.graphics.endFill();
			*/
		}
		
	}

}
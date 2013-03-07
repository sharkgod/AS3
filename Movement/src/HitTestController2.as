package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import mx.core.UIComponent;
	import spark.core.SpriteVisualElement;
	import components.Button1;
	
	/**
	 * ...
	 * @author ...
	 */
	public class HitTestController2 extends SpriteVisualElement
	{
		
		private var _balls:Array = [];
		private var _spring:Number = 0.1;
		private var _bounce:Number = -1;
		private var _num:uint = 10;
		private var _line:Sprite = new Sprite();
		private var _cos30:Number = Math.cos( 30 * Math.PI / 180 );
		private var _sin30:Number = Math.sin( 30 * Math.PI / 180 );
		private var _sticks:Array = [];
		
		public function HitTestController2() 
		{
			for ( var i:uint = 0, len:uint = this._num; i < len; i++ ) {
				var ball:Ball = new Ball( 20, Math.random() * 255 << 16 | Math.random() * 255 << 8 | Math.random() * 255 );
				ball.x = Math.random() * 400;
				ball.y = Math.random() * 400;
				ball.vx = Math.random() * 10;
				ball.vy = Math.random() * 10;
				this._balls.push( ball );
				
				this.addChild( ball );
			}
			
			var stick:Stick = new Stick( 100, 200, 300, 30 );
			this._sticks.push( stick );
			this.addChild( stick );
			
			var stick1:Stick = new Stick( 100, 200, 300, 0 );
			this._sticks.push( stick1 );
			this.addChild( stick1 );
			
			this.addEventListener( Event.ENTER_FRAME, this.onEnterFrameHandler );
		}
		
		protected function hitTest( ballA:Ball, ballB:Ball ):Boolean {
			var dx:Number = ballA.x - ballB.x,
				dy:Number = ballA.y - ballB.y,
				distance:Number = Math.sqrt( dx * dx + dy * dy ),
				hitDistance:Number = ballA.radius + ballB.radius;
				
			if ( distance <= hitDistance ) {
				return true;
			}
			else {
				return false;
			}
		}
		
		protected function hitLine( ball:Ball, line:Stick ):void {
			var cos:Number = Math.cos( line.rotationRadian ), sin:Number = Math.sin( line.rotationRadian );
			
			var ballRelativeX:Number = ball.x - line.x;
			var ballRelativeY:Number = - ball.y + line.y;
			
			var ballRelativeX1:Number = cos * ballRelativeX - sin * ballRelativeY;
			var ballRelativeY1:Number = sin * ballRelativeX + cos * ballRelativeY;

			if ( ballRelativeY1 > 0 && ballRelativeY1 <= ball.radius && ballRelativeX1 >= 0 && ballRelativeX1 <= line.length ) {
				ball.x = line.x + cos * ballRelativeX1 - sin * ( - ball.radius );
				ball.y = line.y + sin * ballRelativeX1 + cos * ( - ball.radius );
				
				var vx1:Number = ball.vx;
				var vy1:Number = ball.vy * this._bounce;
				
				ball.vx = cos * vx1 - sin * vy1;
				ball.vy = sin * vx1 + cos * vy1;
			}
			else if ( ballRelativeY1 < 0 && ballRelativeY1 >= - ball.radius && ballRelativeX1 >= 0 && ballRelativeX1 <= line.length ) {
				ball.x = line.x + cos * ballRelativeX1 - sin * ( ball.radius );
				ball.y = line.y + sin * ballRelativeX1 + cos * ( ball.radius );

				var vx1:Number = ball.vx;
				var vy1:Number = ball.vy * this._bounce;
				
				ball.vx = cos * vx1 - sin * vy1;
				ball.vy = sin * vx1 + cos * vy1;
			}
		}
		
		protected function onEnterFrameHandler( evt:Event ):void {
			for ( var i:uint = 0; i < this._num; i++ ) {
				var ballA:Ball = this._balls[i];
				
				for ( var j:uint = i + 1;  j < this._num; j++ ) {
					var ballB:Ball = this._balls[j];
					
					if ( this.hitTest( ballA, ballB ) ) {
						var minDistance:Number = ballA.radius + ballB.radius;
						var dy:Number = ballB.y - ballA.y;
						var dx:Number = ballB.x - ballA.x;
						var angle:Number = Math.atan2( dy, dx );
						
						ballB.x = ballA.x + minDistance * Math.cos( angle );
						ballB.y = ballA.y + minDistance * Math.sin( angle );
						
						var ax:Number = this._spring * Math.cos( angle );
						var ay:Number = this._spring * Math.sin( angle );
						
						if ( ballA.vx / Math.abs( ballA.vx ) != ballB.vx / Math.abs( ballB.vx ) ) {
							ballA.vx *= this._bounce;
							ballB.vx *= this._bounce;
						}
						if ( ballA.vy / Math.abs( ballA.vy ) != ballB.vy / Math.abs( ballB.vy ) ) {
							ballA.vy *= this._bounce;
							ballB.vy *= this._bounce;
						}
						
						ballB.vx += ax;
						ballB.vy += ay;
						ballA.vx -= ax;
						ballA.vy -= ay;
					}
				}
			}
			
			for ( var k:uint = 0; k < this._num; k++ ) {
				var ball:Ball = this._balls[k];
				ball.move();
				
				var stickLen:uint = this._sticks.length;
				for ( var l:uint = 0; l < stickLen; l++ ) {
					this.hitLine( ball, this._sticks[l] );
				}
				
				var ballRadius:Number = ball.radius;
				if ( ball.x + ballRadius >= this.stage.stageWidth ) {
					ball.x = this.stage.stageWidth - ballRadius;
					ball.vx *= this._bounce;
				}
				else if ( ball.x - ballRadius <= 0 ) {
					ball.x = ballRadius;
					ball.vx *= this._bounce;
				}
				else {
					//ball.vx *= -this._bounce;
				}
				if ( ball.y + ballRadius >= this.stage.stageHeight ) {
					ball.y = this.stage.stageHeight - ballRadius;
					ball.vy *= this._bounce;
				}
				else if ( ball.y - ballRadius <= 0 ) {
					ball.y = ballRadius;
					ball.vy *= this._bounce;
				}
				else {
					//ball.vy *= -this._bounce;
				}
			}
		}
		
	}

}
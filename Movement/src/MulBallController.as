package  
{
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextField;
	import spark.core.SpriteVisualElement;
	/**
	 * ...
	 * @author ...
	 */
	public class MulBallController extends BallController
	{
		
		private var _controller1:ControllPoint;
		private var _controller2:ControllPoint;
		private var _controller3:ControllPoint;
		
		public function MulBallController() 
		{
			this._controller1 = new ControllPoint( 100, 50 );
			this._controller2 = new ControllPoint( 600, 200 );
			this._controller3 = new ControllPoint( 150, 550 );
			
			this.addChild( this._controller1 );
			this.addChild( this._controller2 );
			this.addChild( this._controller3 );
			
			var text:TextField = new TextField();
			text.text = 'You can drag the controll point...';
			text.x = text.y = 10;
			text.width = 200;
			text.height = 20;
			this.addChild( text );
		}
		
		override protected function onControllerHandler( evt:Event ):void  
		{
			this.graphics.clear();
			
			var ball0:Ball = this._balls[0];
			this.moveBall( ball0, this._controller1.x, this._controller1.y );
			this.moveBall( ball0, this._controller2.x, this._controller2.y );
			this.moveBall( ball0, this._controller3.x, this._controller3.y );
		}
		
		public function get c1():ControllPoint {
			return this._controller1;
		}
		
	}

}
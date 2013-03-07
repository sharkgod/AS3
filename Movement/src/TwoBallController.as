package  
{
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class TwoBallController extends BallController
	{
		
		public function TwoBallController() 
		{
		}
		
		override protected function onControllerHandler( evt:Event ):void {
			this.graphics.clear();
			
			var ball0:Ball = this._balls[0], ball1:Ball = this._balls[1];
			this.moveBall( ball0, ball1.x, ball1.y );
			this.moveBall( ball1, ball0.x, ball0.y );
		}
	}

}
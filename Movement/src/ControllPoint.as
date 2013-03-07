package  
{
	import flash.events.MouseEvent;
	import spark.core.SpriteVisualElement;
	/**
	 * ...
	 * @author ...
	 */
	public class ControllPoint extends SpriteVisualElement
	{
		
		public function ControllPoint( x, y ) 
		{
			this.x = x;
			this.y = y;
			
			this.init();
		}
		
		protected function init():void {
			this.graphics.beginFill( 0x000000 );
			this.graphics.drawCircle( 0, 0, 5 );
			this.graphics.endFill();
			
			this.addEventListener( MouseEvent.MOUSE_DOWN, this.onMouseDownHandler );
			this.addEventListener( MouseEvent.MOUSE_UP, this.onMouseUpHandler );
		}
		
		protected function onMouseDownHandler( evt:MouseEvent ):void
		{
			this.startDrag();
		}
		
		protected function onMouseUpHandler( evt:MouseEvent ):void
		{
			this.stopDrag();
		}
		
	}

}
package  
{
	import spark.core.SpriteVisualElement;
	/**
	 * ...
	 * @author Leo Wu
	 */
	public class Stick extends SpriteVisualElement
	{
		
		public var length:Number;
		public var rotationRadian:Number;
		
		public function Stick( x, y, length:Number, rotation:Number = 0 ) 
		{
			this.x = x;
			this.y = y;
			this.length = length;
			this.rotation = rotation;
			this.rotationRadian = Math.PI / 180 * rotation;
			
			this.graphics.lineStyle( 2, 0x665544 );
			this.graphics.moveTo( 0, 0 );
			this.graphics.lineTo( this.length, 0 );
		}
		
	}

}
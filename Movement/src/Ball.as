package  
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.controls.ButtonBar;
	import PhysicsEngine.RigidityObject;
	import spark.core.SpriteVisualElement;
	/**
	 * ...
	 * @author Leo Wu
	 */
	public class Ball extends SpriteVisualElement
	{
		
		private var _vx:Number;
		private var _vy:Number;
		private var _radius:uint;
		
		public var ro:RigidityObject;
		public var speed:Number;
		public var angle:Number;
		
		public function Ball( radius:Number, color:Number ) {
			this._radius = radius || 20;
			this._vx = this._vy = 0;
			
			this.graphics.beginFill( parseInt( '0x' + color.toString( 16 ) ) || 0xFF6644 );
			this.graphics.drawCircle( 0, 0, this._radius );
			this.graphics.endFill();
			
			this.addEventListener( MouseEvent.CLICK, this.onClickHandler );
		}
		
		public function move():void {
			this.x += this._vx;
			this.y += this._vy;
		}
		
		private function onClickHandler( event:Event ):void {
			trace( this.mouseX, this.mouseY );
		}
		
		public function set vx( vx:Number ):void {
			this._vx = vx;
		}
		
		public function get vx():Number {
			return this._vx;
		}
		
		public function set vy( vy:Number ):void {
			this._vy = vy;
		}
		
		public function get vy():Number {
			return this._vy;
		}
		
		public function set radius( radius:Number ):void {
			this._radius = radius;
		}
		
		public function get radius():Number {
			return this._radius;
		}
		
	}	

}
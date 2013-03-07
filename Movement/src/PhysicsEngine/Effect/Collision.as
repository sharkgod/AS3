package PhysicsEngine.Effect 
{
	/**
	 * ...
	 * @author leo
	 */
	public class Collision extends Effect
	{
		
		/**
		 * Constructor
		 * @param	ratio
		 */
		public function Collision( ratio:Number ) 
		{
			super( ratio );
		}
		
		/**
		 * Compute the axis speed for relative
		 * @param	relative
		 * @return
		 */
		override protected function computeAxisSpeed( relative:*, axisSpeed:AxisSpeed, target:* = null ):AxisSpeed
		{
			// var vx = axisSpeed.vx * this.ratio;
			// var vy = axisSpeed.vy * this.ratio;
			
			var targetSpeed:AxisSpeed = Effect.resolveSpeed( target.speed, relative.angle );
			
			var dx:Number = target.x - relative.x;
			var dy:Number = target.y - relative.y;
			var angle:Number = Math.atan2( dy, dx );
			
			var ax:Number = this.ratio * Math.cos( angle );
			var ay:Number = this.ratio * Math.sin( angle );
			
			if ( 
			
			return new AxisSpeed( vx, vy );
		}
		
	}

}
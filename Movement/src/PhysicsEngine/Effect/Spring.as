package PhysicsEngine.Effect 
{
	import flash.geom.Point;
	import PhysicsEngine.Data.AxisSpeed;
	import PhysicsEngine.Data.CombineSpeed;
	import PhysicsEngine.IRigidityObject;
	/**
	 * ...
	 * @author Leo Wu
	 */
	public class Spring extends Effect
	{
		
		/**
		 * Constructor
		 */
		public function Spring( ratio:Number ) 
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
			var vx = axisSpeed.vx + ( target.x - relative.x ) * this.ratio;
			var vy = axisSpeed.vy + ( target.y - relative.y ) * this.ratio;
			
			return new AxisSpeed( vx, vy );
		}
		
	}

}
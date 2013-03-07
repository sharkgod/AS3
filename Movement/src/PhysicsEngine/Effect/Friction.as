package PhysicsEngine.Effect 
{
	import PhysicsEngine.Data.AxisSpeed;
	import PhysicsEngine.IRigidityObject;
	/**
	 * ...
	 * @author Leo Wu
	 */
	public class Friction extends Effect
	{
		
		/**
		 * Constructor
		 * @param	ratio
		 */
		public function Friction( ratio:Number ) 
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
			var vx = axisSpeed.vx * this.ratio;
			var vy = axisSpeed.vy * this.ratio;
			
			return new AxisSpeed( vx, vy );
		}
		
	}

}
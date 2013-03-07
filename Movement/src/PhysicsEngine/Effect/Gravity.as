package PhysicsEngine.Effect 
{
	import PhysicsEngine.Data.AxisSpeed;
	/**
	 * ...
	 * @author Leo Wu
	 */
	public class Gravity extends Effect
	{
		
		/**
		 * Constructor
		 * @param	ratio
		 */
		public function Gravity( ratio:Number ) 
		{
			super( ratio );
		}
		
		/**
		 * Compute the axis speed for relative
		 * @param	relative
		 * @param	axisSpeed
		 * @return
		 */
		override protected function computeAxisSpeed( relative:*, axisSpeed:AxisSpeed, target:* = null ):AxisSpeed
		{
			 var vy = axisSpeed.vy + this.ratio;
			//var vx = axisSpeed.vx + ( this.target.x - relative.x ) * this.ratio;
			//var vy = axisSpeed.vy + ( this.target.y - relative.y ) * this.ratio;

			return new AxisSpeed( axisSpeed.vx, vy );
		}
		
	}

}
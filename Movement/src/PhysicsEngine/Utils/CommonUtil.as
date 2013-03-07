package PhysicsEngine.Utils 
{
	/**
	 * ...
	 * @author Leo Wu
	 */
	public class CommonUtil 
	{
		
		// The radian and angle factor
		public static var radianFactor:Number = Math.PI / 180;
		public static var angleFactor:Number = 180 / Math.PI;
		
		/**
		 * Constructor
		 */
		public function CommonUtil() 
		{
		}
		
		/**
		 * Convert angle to radian
		 * @param	angle
		 * @return
		 */
		public static function angleToRadian( angle:Number ):Number
		{
			return CommonUtil.radianFactor * angle;
		}
		
		/**
		 * Convert radian to angle
		 * @param	radian
		 * @return
		 */
		public static function radianToAngle( radian:Number ):Number
		{
			return CommonUtil.angleFactor * radian;
		}
		
		/**
		 * Compute the speed
		 * @param	vx
		 * @param	vy
		 * @return
		 */
		public static function computeSpeed( vx:Number, vy:Number ):Number
		{
			return Math.sqrt( vx * vx + vy * vy );
		}
	}

}
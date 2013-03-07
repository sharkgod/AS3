package PhysicsEngine.Data 
{
	
	import PhysicsEngine.Utils.CommonUtil;
	/**
	 * ...
	 * @author Leo Wu
	 */
	public class CombineSpeed 
	{
		
		// The speed
		public var speed:Number;
		// The speed direction
		public var angle:Number;
		// The speed direction
		public var radian:Number;
		
		public function CombineSpeed( speed:Number = 0, angle:Number = 0 ) 
		{
			this.speed = speed;
			this.angle = angle;
			this.radian = CommonUtil.angleToRadian( angle );
		}
		
	}

}
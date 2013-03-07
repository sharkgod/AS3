package PhysicsEngine.Effect 
{
	import PhysicsEngine.Data.AxisSpeed;
	import PhysicsEngine.Data.CombineSpeed;
	import PhysicsEngine.IRigidityObject;
	import PhysicsEngine.Utils.CommonUtil;
	/**
	 * ...
	 * @author Leo Wu
	 */
	public class Effect implements IEffect
	{
		
		// The spring
		public var ratio:Number; 
		
		// The target
		public var target:*;
		
		/**
		 * Constructor
		 */
		public function Effect( ratio:Number = 0 )
		{
			this.ratio = ratio;
		}
		
		/**
		 * Affect the relative object
		 * @param	relative
		 */
		public function affect( relative:*, target:* ):void
		{
			var axisSpeed:AxisSpeed = Effect.resolveSpeed( relative.speed, relative.angle );
			axisSpeed = this.computeAxisSpeed( relative, axisSpeed, target );
			
			this.affectRelative( relative, axisSpeed );
			this.affectTarget();
		}
		
		protected function computeAxisSpeed( relative:*, axisSpeed:AxisSpeed, target:* = null ):AxisSpeed
		{
			return axisSpeed;
		}
		
		/**
		 * Compute the data for relative
		 * @param	relative
		 */
		protected function affectRelative( relative:*, axisSpeed:AxisSpeed ):void
		{
			relative.x += axisSpeed.vx;
			relative.y += axisSpeed.vy;
			
			var combineSpeed:CombineSpeed = Effect.combineSpeed( axisSpeed.vx, axisSpeed.vy );
			relative.speed = combineSpeed.speed;
			relative.angle = combineSpeed.angle;
		}
		
		/**
		 * Affect the target object
		 */
		protected function affectTarget():void
		{
		}
		
		/**
		 * Resolve the speed into x and y ones
		 * @param	speed
		 * @param	angle
		 * @return
		 */
		public static function resolveSpeed( speed:Number, angle:Number ):AxisSpeed
		{
			var radian:Number = CommonUtil.angleToRadian( angle );
			
			return new AxisSpeed( speed * Math.cos( radian ), speed * Math.sin( radian ) );
		}
		
		/**
		 * Combine the x and y speed
		 * @param	vx
		 * @param	vy
		 * @return
		 */
		public static function combineSpeed( vx:Number, vy:Number ):CombineSpeed
		{
			var radian = Math.atan2( vy, vx );
			
			return new CombineSpeed( CommonUtil.computeSpeed( vx, vy ), CommonUtil.radianToAngle( radian ) );
		}
		
	}

}
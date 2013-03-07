package PhysicsEngine.Effect 
{
	import PhysicsEngine.Data.AxisSpeed;
	import PhysicsEngine.IRigidityObject;
	
	/**
	 * ...
	 * @author Leo Wu
	 */
	public interface IEffect 
	{
		function affect( relative:*, target:* ):void;
		
		//function computeAxisSpeed( relative:*, axisSpeed:AxisSpeed ):AxisSpeed;
		
		//function affectRelative( relative:*, axisSpeed:AxisSpeed ):void;
		
	  //  function affectTarget():void;
		
	}
	
}
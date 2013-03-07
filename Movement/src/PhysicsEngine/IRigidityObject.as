package PhysicsEngine 
{
	import PhysicsEngine.Effect.Effect;
	import PhysicsEngine.Effect.IEffect;
	
	/**
	 * ...
	 * @author Leo Wu
	 */
	public interface IRigidityObject 
	{
		function addEffect( effect:IEffect ):void;
		
		function removeEffectByIndex( index:uint ):Boolean;
		
		function affect( relative:* ):void;
	}
	
}
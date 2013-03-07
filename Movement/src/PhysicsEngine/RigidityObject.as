package PhysicsEngine 
{
	import flash.geom.Rectangle;
	import mx.collections.ArrayList;
	import PhysicsEngine.Effect.Effect;
	import PhysicsEngine.Effect.IEffect;
	import spark.core.SpriteVisualElement;
	/**
	 * ...
	 * @author Leo Wu
	 */
	public class RigidityObject implements IRigidityObject
	{
		
		// The target
		public var target:*;
		
		// The speed
		public var speed:Number;
		
		// The angle
		public var angle:Number;
		
		// The mass
		public var mass:Number;
		
		// The effect list
		protected var effectList:Array;
		
		/**
		 * Constructor
		 * @param	target
		 */
		public function RigidityObject( target:*, speed:Number = 0, anlge:Number = 0, mass:Number = 0 ) 
		{
			this.target = target;
			this.speed = speed;
			this.angle = angle;
			this.mass = mass;
			
			this.effectList = [];
		}
		
		/**
		 * Add one effect to effect list
		 * @param	effect
		 */
		public function addEffect( effect:IEffect ):void
		{
			this.effectList.push( effect );
		}
		
		/**
		 * Remove one effect from effect list by index
		 * @param	index
		 */
		public function removeEffectByIndex( index:uint ):Boolean
		{
			for ( var i:uint = 0, len:uint = this.effectList.length; i < len; i++ )
			{
				if ( i == index )
				{
					this.effectList.splice( i, 1 );
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * Affect the target object
		 * @param	target
		 */
		public function affect( relative:* ):void
		{
			for ( var i:uint = 0, len:uint = this.effectList.length; i < len; i++ ) {
				this.effectList[i].affect( relative, this.target );
			}
		}
		
		/**
		 * Collision
		 * @param	relative
		 */
		public function collision( relative:* ):void
		{
				/*
			var minDistance:Number = ballA.radius + ballB.radius;
			var dy:Number = ballB.y - ballA.y;
			var dx:Number = ballB.x - ballA.x;
			var angle:Number = Math.atan2( dy, dx );
			
			ballB.x = ballA.x + minDistance * Math.cos( angle );
			ballB.y = ballA.y + minDistance * Math.sin( angle );
			
			var ax:Number = this._spring * Math.cos( angle );
			var ay:Number = this._spring * Math.sin( angle );
			
			if ( ballA.vx / Math.abs( ballA.vx ) != ballB.vx / Math.abs( ballB.vx ) ) {
				ballA.vx *= this._bounce;
				ballB.vx *= this._bounce;
			}
			if ( ballA.vy / Math.abs( ballA.vy ) != ballB.vy / Math.abs( ballB.vy ) ) {
				ballA.vy *= this._bounce;
				ballB.vy *= this._bounce;
			}
			
			ballB.vx += ax;
			ballB.vy += ay;
			ballA.vx -= ax;
			ballA.vy -= ay;*/
		}
		
	}
	
}
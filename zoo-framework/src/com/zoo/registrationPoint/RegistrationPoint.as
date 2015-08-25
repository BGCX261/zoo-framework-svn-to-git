package com.zoo.registrationPoint {
	import flash.display.MovieClip;
	import flash.geom.Rectangle;

	/**
	 * @author Marelo Duende
	 */
	public class RegistrationPoint extends MovieClip{
		public function RegistrationPoint(obj:Object, newX:Number, newY:Number):void{
			
			var bounds:Rectangle = obj.getBounds(obj.parent);
			var currentRegX:Number = obj.x - bounds.left;
			var currentRegY:Number = obj.y - bounds.top;
			
			var xOffset:Number = newX - currentRegX;
			var yOffset:Number = newY - currentRegY;
			
			obj.x += xOffset;
			obj.y += yOffset;
			
			for(var i:int = 0; i < obj.numChildren; i++) {
				obj.getChildAt(i).x -= xOffset;
				obj.getChildAt(i).y -= yOffset;
			}
		}
		public static function setRegPoint(obj:Object, newX:Number, newY:Number):RegistrationPoint {
			return new RegistrationPoint(obj, newX, newY);
		}
	}
}

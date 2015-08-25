package com.zoo.alignerMethods {
	import com.greensock.TweenLite;

	import flash.display.DisplayObject;

	/**
	 * @author marcelo duende
	 */
	public class Left {
		public function Left($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, paddingDifferenceX:int)
		{
			
			if($saveVars[$tween+1])
			{
				if($saveVars[$time+1] > 0)
				{
					TweenLite.to($target, $saveVars[$time+1], {x:0 + $paddingDifference + paddingDifferenceX});
				} else {
					$target.x = 0 + $paddingDifference + paddingDifferenceX;
				}
			} else {
				$target.x = 0 + $paddingDifference + paddingDifferenceX;
			}
		}
		public static function init($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, paddingDifferenceX:int):Left
		{
			return new Left($saveVars, $tween, $time, $target, $paddingDifference, paddingDifferenceX);
		}
	}
}

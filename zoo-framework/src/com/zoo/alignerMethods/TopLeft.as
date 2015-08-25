package com.zoo.alignerMethods {
	import com.greensock.TweenLite;

	import flash.display.DisplayObject;

	/**
	 * @author marcelo duende
	 */
	public class TopLeft {
		public function TopLeft($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, $paddingDifferenceX:int, $paddingDifferenceY:int)
		{
			if($saveVars[$tween+1])
			{
				if($saveVars[$time+1] > 0)
				{
					TweenLite.to($target, $saveVars[$time+1], {x:0 + $paddingDifference + $paddingDifferenceX, y:0 + $paddingDifference + $paddingDifferenceY});
				} else {
					$target.x = 0 + $paddingDifference + $paddingDifferenceX;
					$target.y = 0 + $paddingDifference + $paddingDifferenceY;
				}
			} else {
				$target.x = 0 + $paddingDifference + $paddingDifferenceX;
				$target.y = 0 + $paddingDifference + $paddingDifferenceY;
			}
		}
		public static function init($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int,  $paddingDifferenceX:int, $paddingDifferenceY:int):TopLeft
		{
			return new TopLeft($saveVars, $tween, $time, $target, $paddingDifference, $paddingDifferenceX, $paddingDifferenceY);
		}
	}
}

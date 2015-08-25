package com.zoo.alignerMethods {
	import com.greensock.TweenLite;

	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.Rectangle;

	/**
	 * @author marcelo duende
	 */
	public class TopRight {
		public function TopRight($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, $paddingDifferenceY:int, $paddingDifferenceX:int, $environment:Stage)
		{
			var getBound:Rectangle = $target.getBounds($target.parent);
			if($saveVars[$tween+1])
			{
				if($saveVars[$time+1] > 0)
				{
					TweenLite.to($target, $saveVars[$time+1], {x:($environment.stageWidth - getBound.width) - $paddingDifference - $paddingDifferenceX, y:0 + $paddingDifference + $paddingDifferenceY});
				} else {
					$target.x = ($environment.stageWidth - getBound.width) - $paddingDifference - $paddingDifferenceX;
					$target.y = 0 + $paddingDifference + $paddingDifferenceY;
				}
			} else {
				$target.x = ($environment.stageWidth - getBound.width) - $paddingDifference - $paddingDifferenceX;
				$target.y = 0 + $paddingDifference + $paddingDifferenceY;
			}
		}
		public static function init($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, $paddingDifferenceY:int, $paddingDifferenceX:int, $environment:Stage):TopRight
		{
			return new TopRight($saveVars, $tween, $time, $target, $paddingDifference, $paddingDifferenceY, $paddingDifferenceX, $environment);
		}
	}
}

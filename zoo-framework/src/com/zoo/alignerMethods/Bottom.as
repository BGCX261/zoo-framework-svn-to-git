package com.zoo.alignerMethods {
	import com.greensock.TweenLite;

	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.Rectangle;

	/**
	 * @author marcelo duende
	 */
	public class Bottom {
		public function Bottom($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, paddingDifferenceY:int, $environment:Stage)
		{
			var getBound:Rectangle = $target.getBounds($target.parent);
			if($saveVars[$tween+1])
			{
				if($saveVars[$time+1] > 0)
				{
					TweenLite.to($target, $saveVars[$time+1], {y:($environment.stageHeight - getBound.height) - $paddingDifference - paddingDifferenceY});
				} else {
					$target.y = ($environment.stageHeight - getBound.height) - $paddingDifference - paddingDifferenceY;
				}
			} else {
				$target.y = ($environment.stageHeight - getBound.height) - $paddingDifference - paddingDifferenceY;
			}
		}
		public static function init($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, paddingDifferenceY:int, $environment:Stage):Bottom
		{
			return new Bottom($saveVars, $tween, $time, $target, $paddingDifference, paddingDifferenceY, $environment);
		}
	}
}

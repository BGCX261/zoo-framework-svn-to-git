package com.zoo.alignerMethods {
	import com.greensock.TweenLite;

	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.Rectangle;

	/**
	 * @author marcelo duende
	 */
	public class BottomCenter {
		public function BottomCenter($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, $environment:Stage)
		{
			var getBound:Rectangle = $target.getBounds($target.parent);
			if($saveVars[$tween+1])
			{
				if($saveVars[$time+1] > 0)
				{
					TweenLite.to($target, $saveVars[$time+1], {x:($environment.stageWidth - getBound.width) >> 1, y:($environment.stageHeight - getBound.height) - $paddingDifference});
				} else {
					$target.x = ($environment.stageWidth - getBound.width) >> 1;
					$target.y = ($environment.stageHeight - getBound.height) - $paddingDifference;
				}
			} else {
				$target.x = ($environment.stageWidth - getBound.width) >> 1;
				$target.y = ($environment.stageHeight - getBound.height) - $paddingDifference;
			}
		}
		public static function init($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, $environment:Stage):BottomCenter
		{
			return new BottomCenter($saveVars, $tween, $time, $target, $paddingDifference, $environment);
		}
	}
}

package com.zoo.alignerMethods {
	import com.greensock.TweenLite;

	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.Rectangle;

	/**
	 * @author marcelo duende
	 */
	public class LeftCenter {
		public function LeftCenter($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, $environment:Stage)
		{
			var getBound:Rectangle = $target.getBounds($target.parent);
			if($saveVars[$tween+1])
			{
				if($saveVars[$time+1] > 0)
				{
					TweenLite.to($target, $saveVars[$time+1], {x:0 + $paddingDifference, y:($environment.stageHeight - getBound.height) >> 1});
				} else {
					$target.x = 0 + $paddingDifference;
					$target.y = ($environment.stageHeight - getBound.height) >> 1;
				}
			} else {
				$target.x = 0 + $paddingDifference;
				$target.y = ($environment.stageHeight - getBound.height) >> 1;
			}
		}
		public static function init($$saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $$paddingDifference:int, $environment:Stage):LeftCenter
		{
			return new LeftCenter($$saveVars, $tween, $time, $target, $$paddingDifference, $environment);
		}
	}
}

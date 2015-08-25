package com.zoo.alignerMethods {
	import com.greensock.TweenLite;

	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.Rectangle;

	/**
	 * ...
	 * @author marcelo duende
	 */
	public class RightCenter 
	{
		public function RightCenter($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, $environment:Stage)
		{
			var getBound:Rectangle = $target.getBounds($target.parent);
			if($saveVars[$tween+1])
			{
				if($saveVars[$time+1] > 0)
				{
					TweenLite.to($target, $saveVars[$time+1], {x:($environment.stageWidth - getBound.width) - $paddingDifference, y:($environment.stageHeight - getBound.height) >> 1});
				} else {
					$target.x = ($environment.stageWidth - getBound.width) - $paddingDifference;
					$target.y = ($environment.stageHeight - getBound.height) >> 1;
				}
			} else {
				$target.x = ($environment.stageWidth - getBound.width) - $paddingDifference;
				$target.y = ($environment.stageHeight - getBound.height) >> 1;
			}
		}
		public static function init($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, $environment:Stage):RightCenter
		{
			return new RightCenter($saveVars, $tween, $time, $target, $paddingDifference, $environment);
		}
	}
}

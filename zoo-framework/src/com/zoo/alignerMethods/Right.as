package com.zoo.alignerMethods {
	import com.greensock.TweenLite;

	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.Rectangle;

	/**
	 * ...
	 * @author Marcelo Duende
	 */
	public class Right 
	{
		public function Right($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, paddingDifferenceX:int, $environment:Stage)
		{
			var getBound:Rectangle = $target.getBounds($target.parent);
			if($saveVars[$tween+1])
			{
				if($saveVars[$time+1] > 0)
				{
					TweenLite.to($target, $saveVars[$time+1], {x:($environment.stageWidth - getBound.width) - $paddingDifference - paddingDifferenceX});
				} else {
					$target.x = $environment.stageWidth - getBound.width - $paddingDifference - paddingDifferenceX;
				}
			} else {
				$target.x = $environment.stageWidth - getBound.width - $paddingDifference - paddingDifferenceX;
			}
		}
		public static function init($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, paddingDifferenceX:int, $environment:Stage):Right
		{
			return new Right($saveVars, $tween, $time, $target, $paddingDifference, paddingDifferenceX, $environment);
		}
	}
	
}
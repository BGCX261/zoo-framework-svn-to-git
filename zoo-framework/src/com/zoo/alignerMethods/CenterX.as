package com.zoo.alignerMethods {
	import com.greensock.TweenLite;

	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.Rectangle;

	/**
	 * @author marcelo duende
	 */
	public class CenterX {
		public function CenterX($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $environment:Stage)
		{
			var getBound:Rectangle = $target.getBounds($target.parent);
			if($saveVars[$tween+1])
			{
				if($saveVars[$time+1] > 0)
				{
					TweenLite.to($target, $saveVars[$tween+1], {x:($environment.stageWidth - getBound.width) >> 1});
				} else {
					$target.x = ($environment.stageWidth - getBound.width) >> 1;
					
				}
			} else {
				$target.x = ($environment.stageWidth - getBound.width) >> 1;
				
			}
		}
		public static function init($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $environment:Stage):CenterX
		{
			return new CenterX($saveVars, $tween, $time, $target, $environment);
		}
	}
}

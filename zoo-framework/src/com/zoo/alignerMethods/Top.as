package com.zoo.alignerMethods {
	import com.greensock.TweenLite;

	import flash.display.DisplayObject;

	/**
	 * ...
	 * @author Marcelo Duende
	 */
	public class Top 
	{
		public function Top($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, $paddingDifferenceY:int, $paddingY:int)
		{
			if($saveVars[$tween+1])
			{
				if($saveVars[$time+1] > 0)
				{
					if ($saveVars[$paddingY+1] > 0) 
					{
						TweenLite.to($target, $saveVars[$time+1], {y:0 + $paddingDifferenceY});
					} 
					else 
					{
						TweenLite.to($target, $saveVars[$time+1], {y:0 + $paddingDifference});
					}
					
				} else {
					if ($saveVars[$paddingY+1] > 0) 
					{
						$target.y = 0 + $paddingDifferenceY;
					} else 
					{
						$target.y = 0 + $paddingDifference;
					}
				}
			} else {
				if ($saveVars[$paddingY+1] > 0) 
				{
					$target.y = 0 + $paddingDifferenceY;
				} else 
				{
					$target.y = 0 + $paddingDifference;
				}
				
			}
		}
		public static function init($saveVars:Array, $tween:int, $time:int, $target:DisplayObject, $paddingDifference:int, $paddingDifferenceY:int, $paddingY:int):Top
		{
			return new Top($saveVars, $tween, $time, $target, $paddingDifference, $paddingDifferenceY, $paddingY);
		}
	}
	
}
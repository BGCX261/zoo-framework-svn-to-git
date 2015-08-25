package com.zoo.resizeMethods {

	/**
	 * @author marcelo duende
	 */
	public class Width {
		public function Width($target:Object, $width:int)
		{
			$target.width = $width;
		}
		public static function init($target:Object, $width:int):Width
		{
			return new Width($target, $width);
		}
	}
}

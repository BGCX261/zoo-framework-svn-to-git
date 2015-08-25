package com.zoo.resizeMethods {

	/**
	 * @author marcelo duende
	 */
	public class Height {
		public function Height($target:Object, $height:int)
		{
			$target.height = $height;
		}
		public static function init($target:Object, $height:int):Height
		{
			return new Height($target, $height);
		}
	}
}

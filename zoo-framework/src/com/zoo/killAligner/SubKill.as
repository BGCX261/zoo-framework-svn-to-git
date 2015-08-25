package com.zoo.killAligner {

	/**
	 * @author marcelo duende
	 */
	public class SubKill extends ParentKill{
		public static const CLASS_NAME:String = "sub Kill";
		
		public function SubKill()
		{
			super();
 
			//trace ("CLASS_NAME:", CLASS_NAME);
		}
		public static function staticFunction ():void
		{
			//trace ("SubKill.staticFunction()");
		} 
	
	}
}

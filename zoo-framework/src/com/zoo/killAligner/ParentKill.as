package com.zoo.killAligner {

	/**
	 * @author marcelo duende
	 */
	public class ParentKill{
		public static const CLASS_NAME:String = "Parent Kill";
		public var _checkKillAllPrivate:Boolean;
 		public var _checkKillAll:Boolean;
		public static function staticFunction ():void
		{
			//trace ("ParentKill.staticFunction()");
		} 
 
		public function inheritedFunction ():void
		{
			//trace ("ParentKill.inheritedFunction()");
			_checkKillAllPrivate = true;
			_checkKillAll = true;
		
		}
		public function removeFunction ():void
		{
			//trace ("ParentKill.inheritedFunction()");
			_checkKillAllPrivate = false;
			_checkKillAll = false;
			
		}
		
	}
}

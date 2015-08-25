/*
 * @ usage
 * import com.zoo.TimelineLoop;
 * var myNewMovieClip:TimelineLoop = new TimelineLoop(myMovieClipName)
 * myNewMovieClip.nextFrame();
 * 
 * To return the native nextFrame(); use it.
 * myNewMovieClip.nativeNextFrame();
 * 
 */


package com.zoo {
	import flash.display.MovieClip;

	/**
	 * @author Marcelo Duende
	 */
	public class TimelineLoop extends MovieClip{
		public var _target:MovieClip;
		public function TimelineLoop($target:MovieClip):void{
			_target = $target;
		}
		override public function nextFrame():void
		{
			if (_target.currentFrame == _target.totalFrames){
				_target.gotoAndStop(1);
			} else{
				_target.gotoAndStop(_target.currentFrame + 1);
			}
		}
		public function nativeNextFrame():void
		{
			super.nextFrame();
		}
	}
}
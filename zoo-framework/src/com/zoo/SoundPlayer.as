﻿/**  * ... * @author Marcelo Duende *  * @version 0.02 *  * @usage  * import com.zoo.SoundPlayer; * SoundPlayer.add($url, { $vars }); *  * SoundPlayer.add("myMusic.mp3", {loop:0, fadeInOut:true, volume:1, autoPlay:false, id:"sound1"});  *  * ---------------------------------------------- *  * @param  * $url = The object to be defined to be a own url;  * $vars = Here, we can get both loop, fadeIn, fadeOut, fadeInOut, volume, autoPlay and id. *  * $loop = Here we can set the times that own sound will be played; * $fadeIn, fadeOut, fadeInOut = Here we can set fades to own sound, the parameter of this property is "true"; * $volume = This feature set own volume, this unit is measured between 0 and 1, if you want to set middle of volume uses 0.5; * $autoPlay = Just to set if the sounds starts playing or no, the parameter of this one is "true"; * $id = With own "id" we can control own sound, able to play and stop in specific sound. * * * * SoundPlayer.control("sound1", {command:"play"});	 * SoundPlayer.control("all", {command:"stop"});	 *  * ---------------------------------------------- *  * @param  * $"sound1" = This os own ID that we already set before; * $"all" = This os own property to stop all sounds; * $command = This is oun method to execute the action, we can put "play" and "stop" properties; * */package com.zoo{	import flash.net.*;	import flash.media.*;	import flash.events.*;	import flash.utils.Timer;	//import Zoo.Play;	public class SoundPlayer extends CheckVersion	{		/* set version */		private const _version:Number = 0.02;				/* sound settings */		private var _loop:int = 0;		private var _fadeIn:int = 0;		private var _fadeOut:int = 0;		private var _fadeInOut:int = 0;		private var _volume:Number = 0;		private var _autoPlay:int = 0;		private var _id:int = 0;		private var _command:int = 0;		private var _commandValue:String;		private var _url:String;		private var mySound:Sound = new Sound();		private var mySoundChannel:SoundChannel = new SoundChannel();		private var mySoundTransform:SoundTransform = new SoundTransform();		private var mySoundMixer:SoundMixer = new SoundMixer();				private var saveVars:Array = new Array();		public static var saveId:Array = new Array();		public static var saveValues:Array = new Array();		private var checkEnterTime:int = 0;				private var soundFadeInTimer:Timer = new Timer(100,30);		private var soundFadeOutTimer:Timer = new Timer(100,30);		private var soundFadeOutCheckTimer:Timer = new Timer(999);		private var fadeInIncr:Number = 0.1;		private var fadeOutIncr:Number = 1;				public function SoundPlayer($url, $vars):void		{			super();			if(_version == version)			{												for (var a:* in $vars) {					var _tmp:Object = new Object();					_tmp["property"] = a;					_tmp["value"] = $vars[a];					saveVars.push(_tmp["property"], _tmp["value"]);					if(_tmp["property"] == "loop" || _tmp["property"] == "fadeIn" || _tmp["property"] == "fadeOut" || _tmp["property"] == "fadeInOut" || _tmp["property"] == "volume" || _tmp["property"] == "autoPlay" || _tmp["property"] == "id" || _tmp["property"] == "command")					{						switch (_tmp["property"])						{							case "loop":								_loop = saveVars.indexOf(a);								break;							case "fadeIn":								_fadeIn = saveVars.indexOf(a);								break;							case "fadeOut":								_fadeOut = saveVars.indexOf(a);								break;							case "fadeInOut":								_fadeInOut = saveVars.indexOf(a);								break;							case "volume":								_volume = saveVars.indexOf(a);								break;							case "autoPlay":								_autoPlay = saveVars.indexOf(a);								break;							case "id":								_id = saveVars.indexOf(a);								break;							case "command":								_command = saveVars.indexOf(a);								_commandValue = saveVars[_command+1];								break;						}					}				}								_url = $url;				saveValues.push(_url);				saveId.push(saveVars[_id+1]);				/* Checking ID to control Sound */				for(var c:int = 0; c < saveId.length; c++)				{					if(_url == saveId[c].toString())					{						_url = saveValues[c]						saveVars[_autoPlay+1] = true;					}				}				SoundStarts();			}		}				public static function add($url:Object, $vars:Object):SoundPlayer		{			return new SoundPlayer($url, $vars);		}				public static function control($url:String, $vars:Object)  {			SoundPlayer.saveId[$url] = new SoundPlayer($url, $vars);			return SoundPlayer.saveId[$url] as SoundPlayer;      	}				public function SoundStarts():void		{						/*				Stop Sounds on new call			*/			if(SoundMixer.areSoundsInaccessible() == false) {				SoundMixer.stopAll();			}			//trace(saveVars[_command+1] + "  command")			if(_commandValue != "stop")			{				mySound.load(new URLRequest(_url));				mySound.addEventListener(Event.COMPLETE, DispatchSoundEvents);			} else {				trace("boom");			}								}		public function DispatchSoundEvents(event:Event):void		{			if(saveVars[_autoPlay+1] == true)			{				Play();			}		}		public function Play():void		{			mySoundChannel = mySound.play(0, int(saveVars[_loop+1] + 1), null);			fadeOutIncr = saveVars[_volume+1];						if(saveVars[_fadeIn+1] != true || saveVars[_fadeOut+1] != true || saveVars[_fadeInOut+1] != true)			{				mySoundChannel.soundTransform = new SoundTransform(saveVars[_volume+1], 0);			}						if(saveVars[_fadeIn+1] == true)			{				soundFadeInTimer.addEventListener(TimerEvent.TIMER, SoundFadeIn);				soundFadeInTimer.addEventListener(TimerEvent.TIMER_COMPLETE, SoundFadeInComplete);				soundFadeInTimer.start();				mySoundChannel.soundTransform = new SoundTransform(fadeInIncr, 0);			} 			if(saveVars[_fadeOut+1] == true)			{				soundFadeOutCheckTimer.addEventListener(TimerEvent.TIMER, CheckLength);				soundFadeOutCheckTimer.start();			}			if(saveVars[_fadeInOut+1] == true)			{				soundFadeInTimer.addEventListener(TimerEvent.TIMER, SoundFadeIn);				soundFadeInTimer.addEventListener(TimerEvent.TIMER_COMPLETE, SoundFadeInComplete);				soundFadeInTimer.start();				mySoundChannel.soundTransform = new SoundTransform(fadeInIncr, 0);				soundFadeOutCheckTimer.addEventListener(TimerEvent.TIMER, CheckLength);				soundFadeOutCheckTimer.start();				trace(soundFadeOutCheckTimer)			}		}						//----------------------------------------------------------------------------------------------------------------------		/****************************************************** fadeOut ********************************************************/				public function CheckLength(event:TimerEvent):void		{			if(int(mySoundChannel.position) > (int(mySound.length - 4000)))			{				soundFadeOutCheckTimer.stop();				soundFadeOutTimer.addEventListener(TimerEvent.TIMER, SoundFadeOut);				soundFadeOutTimer.start();			}		}		public function SoundFadeOut(event:TimerEvent):void		{			fadeOutIncr -= 1/30;			mySoundChannel.soundTransform = new SoundTransform(fadeOutIncr, 0);			if(fadeOutIncr <= 0)			{				soundFadeOutTimer.stop();				fadeOutIncr = 0;			}		}				//----------------------------------------------------------------------------------------------------------------------		/****************************************************** End fadeOut ********************************************************/								//----------------------------------------------------------------------------------------------------------------------		/******************************************************** fadeIn ********************************************************/				public function SoundFadeIn(event:TimerEvent):void		{			if(saveVars[_volume+1] <= fadeInIncr)			{				fadeInIncr = saveVars[_volume+1];				soundFadeInTimer.stop();			} else {				fadeInIncr += 1/30;			}			mySoundChannel.soundTransform = new SoundTransform(fadeInIncr, 0);		}		public function SoundFadeInComplete(event:TimerEvent):void		{			soundFadeInTimer.stop();			fadeInIncr = 1;		}				/***************************************************** End fadeIn *****************************************************/		//----------------------------------------------------------------------------------------------------------------------								public function Stop($id):void		{			mySoundChannel.stop();		}	}}
/*
 * @author Marcelo Duende
 * 
 * @usage
 * 
 * import com.zoo.searcher.XMLSearcher;
 * XMLSearcher.search("xml.xml", {term:"pa", xmlTag:"searchTag", onComplete:returns});
 * 
 * where "term" means the word to find in your attributes,
 * "xmlTag" means the tag setted into XML,
 * "onComplete" means the function called when the xml is loaded.
 * 
 * the XML
 * 
 * <?xml version="1.0" encoding="UTF-8"?>
 *<data>
 *	<depth1>
 *		<depth2>
 *			<depth3 searchTag="duende">
 *				<test><![CDATA[duende]]></test>
 *			</depth3>
 *			<depth3>
 *				<content searchTag="day 1">
 *					<desc><![CDATA[Strengths duende]]></desc>
 *				</content>
 *				<content searchTag="have do be , pa">
 *					<desc><![CDATA[It's cray baby]]></desc>
 *				</content>
 *				<content searchTag="strengths finder , day 1">
 *					<desc><![CDATA[Strenasdasdgths Finder]]></desc>
 *				</content>
 *				<content searchTag="strengths finder , day 1">
 *					<desc><![CDATA[Strengths dfsdf  Finder]]></desc>
 *				</content>
 *				<content searchTag="day 1">
 *					<desc><![CDATA[Strengths Fuaihdsashdinder]]></desc>
 *				</content>
 *				<content searchTag="have do be , pa">
 *					<desc><![CDATA[It's cray baby]]></desc>
 *				</content>
 *				<content searchTag="strengths finder , day 1">
 *					<desc><![CDATA[Strenasdasdgths Finder]]></desc>
 *				</content>
 *				<content searchTag="strengths finder , day 1">
 *					<desc><![CDATA[Strengths dfsdf  Finder]]></desc>
 *				</content>
 *			</depth3>
 *		</depth2>
 *	</depth1>
 *</data>
 * 
 * 
 *	import com.zoo.searcher.XMLSearcher;
 *	XMLSearcher.search("xml.xml", {term:"duende", xmlTag:"searchTag", type:"attribute", deep:2, onComplete:returns});
 *	
 *	function returns():void{		
 *		//trace(XMLSearcher.searchResults.child("desc")[0].toString() + " found");
 *		trace(XMLSearcher.searchResults);
 *	}
 *	
 *	in output will appear
 *	It's crazy baby
 *	<depth3 searchTag="duende">
 *		<test><![CDATA[duende]]></test>
 *	</depth3>
 *	
 *	:)
 *	
 *	For more information, visit www.marceloduende.com.br/blog and make a search for XMLSearcher. Thank you.
 *	
 */


package com.zoo.searcher {
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.zoo.CheckVersion;

	import flash.net.URLRequest;

	public class XMLSearcher extends CheckVersion{
		
		
		
		/* set version */
		private const _version				: Number = 1.0;
		
		private var xmlUrl					: String;
		
		
		private static var xmlData			: XML;
		public static var searchResults		: XMLList = new XMLList();
		
		private var _term					: int = -1;
		private var _xmlTag					: int = -1;
		private var _type					: int = -1;
		private var _deep					: int = -1;
		private static var _onComplete		: int = -1;
		
		public static var term				: String;
		public static var xmlTag			: String;
		public static var type				: String;
		public static var deep				: int;
		public static var onComplete		: Function;
		
		private var saveVars				: Array = new Array()
		public static var arrSearchTerms	: Array = new Array();				
		public static var arrSearchResults	: Array = new Array();
		
		
		
		public function XMLSearcher($xmlUrl:String, $vars:Object) {
			super();
			
			if(_version == version)
			{
				xmlUrl  = $xmlUrl;
				if(xmlUrl == null)
				{
					trace("You can not use the XMLSearcher features without an object, please set your target reference. XMLSearcher.search($xmlUrl, { $vars });");
				} else 
				{
					
					for (var a:* in $vars) {
						//trace(a)
						var _tmp:Object = new Object();
						_tmp["property"] = a;
						_tmp["value"] = $vars[a];
						saveVars.push(
						_tmp["property"], _tmp["value"]);
						if (_tmp["property"] == "term" || 
						_tmp["property"] == "xmlTag" || 
						_tmp["property"] == "type" || 
						_tmp["property"] == "deep" ||
						_tmp["property"] == "onComplete"
						)
						{
							switch (_tmp["property"])
							{
								case "term":
									_term = saveVars.indexOf(a);
									term = saveVars[_term+1]
									break;
								case "xmlTag":
									_xmlTag = saveVars.indexOf(a);
									xmlTag = saveVars[_xmlTag+1];
									break;
								case "type":
									_type = saveVars.indexOf(a);
									type = saveVars[_type+1];
									break;
								case "deep":
									_deep = saveVars.indexOf(a);
									deep = saveVars[_deep+1];
									break;
								case "onComplete":
									_onComplete = saveVars.indexOf(a);
									onComplete = saveVars[_onComplete+1];
									break;
							}
						}
					}
					LoadingXML();
				}
			} else {
				trace("Your Zoo Framework is outdating, please, visit http://code.google.com/p/zoo-framework/ and download the new version");
			}
		}
		
		private function LoadingXML():void{
			
				var queue:LoaderMax = new LoaderMax({name:"xml", onProgress:progressHandler, onComplete:completeHandler, onError:errorHandler});
				queue.append( new XMLLoader(xmlUrl, {name:"xmlDoc"}) );
				queue.load();
			
		}
			
		
		private function progressHandler(event:LoaderEvent = null):void{
			
		}
		private function completeHandler(event:LoaderEvent = null):void{
			var receiveXml:XML = LoaderMax.getContent("xmlDoc");
			xmlData = receiveXml;
			switch(type){
				case "attribute":
					LookingForAttributeTags();
					break;
				case "node":
					LookingForNodeTags();
					break;
			}
				
		}
		
		private function errorHandler(event:LoaderEvent):void{
			trace("Wrong url Sr, please, put the right path");
		}
		
		private static var termSearch:String;
		// Looking for Nodes
		public static function LookingForNodeTags():XMLList{
			CrazyPath();
			var searchData:XMLList = myPath;
			var searchTerms:XMLList = searchData.*.child(xmlTag);
			arrSearchTerms = [];
			arrSearchResults = [];
			searchResults = XMLList([]);
			for each(var searchItem:XML in searchTerms)
			{
				var searchSplit:String = searchItem.toXMLString();
				arrSearchTerms.push(searchSplit);
				arrSearchResults = new Array();
				for(var  i:int = 0; i<arrSearchTerms.length; i++)
				{
					termSearch = arrSearchTerms[i];
					if (termSearch.search(term) > -1)
					{
						arrSearchResults.push(termSearch);
					}
				}
				termSearch = "";
				arrSearchTerms = [];
				if(arrSearchResults.length != 0)
				{
					searchResults += searchItem.parent();					
				}	
			}
		   if(_onComplete != -1){
		   		onComplete();
		   }
			return searchResults;
		}
		
		// Looking for Attributes
		
		/*
		 * 
		 * A BUG = The way to fix thsis SHIT is to make a switch, but it is a SHIT how as I said
		 * 
		 * 
		 */
		private static var myPath:* = ["*"];
		public static function CrazyPath(){
			switch(deep){
				case 0:
					myPath = xmlData;
				break;
				case 1:
					myPath = xmlData.*;
				break;
				case 2:
					myPath = xmlData.*.*;
				break;
				case 3:
					myPath = xmlData.*.*.*;
				break;
				case 4:
					myPath = xmlData.*.*.*.*;
				break;
				case 5:
					myPath = xmlData.*.*.*.*.*;
				break;
				case 6:
					myPath = xmlData.*.*.*.*.*.*;
				break;
				case 7:
					myPath = xmlData.*.*.*.*.*.*.*;
				break;
				case 8:
					myPath = xmlData.*.*.*.*.*.*.*.*;
				break;
				case 9:
					myPath = xmlData.*.*.*.*.*.*.*.*.*;
				break;
				case 10:
					myPath = xmlData.*.*.*.*.*.*.*.*.*.*;
				break;
				default:
					myPath = xmlData;
				break;
			}
		}
			
		public static function LookingForAttributeTags():XMLList{
			CrazyPath();
			var searchData:XMLList = myPath;
			var searchTerms:XMLList = searchData.*.(hasOwnProperty("@"+xmlTag));
			arrSearchTerms = [];
			arrSearchResults = [];
			searchResults = XMLList([]);
			for each(var searchItem:XML in searchTerms)
			{
				var searchSplit:String = searchItem.attribute(xmlTag).toXMLString();
				arrSearchTerms =  searchSplit.split(" , ");
				arrSearchResults = new Array();
				for each(var termSearch:String in arrSearchTerms)
				{
					if (termSearch == term)
					{
						arrSearchResults.push(termSearch);
					}	
				}
				if(arrSearchResults.length != 0)
				{
					searchResults += searchItem;
				}	
			}
		   if(_onComplete != -1){
		   		onComplete();
		   }
			return searchResults;
		}
		
	
		
		// Receiving data 
		public static function search($xmlUrl:String, $vars:Object):XMLSearcher{
			return new XMLSearcher($xmlUrl, $vars);
		}
	}
}

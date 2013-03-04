package com.comparifier.nozama.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;

	public class GetBrowseCategoriesEvent extends CairngormEvent
	{
		public static var EVENT_GET_BROWSE_CATEGORIES:String = "getBrowseCategories";
		
		public var browseId:String;
		
		//Name of category
		public var name:String;
		
		//Name of Search Index the category is within:
		public var searchIndex:String;
		
		public var isCategoryRoot:Boolean;
		
		public var isLeafCategory:Boolean;
		
		//From what vendor was this command invoked from
		public var vendor:String;
		
		//comma-separated string of all the response groups associated with the Browse operation
		public var responseGroups:String;
		
		//the operation name associated with the browse
		public var operation:String;
		
		/* public function GetBrowseCategoriesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}	 */	
		public function GetBrowseCategoriesEvent()
		{
			super( EVENT_GET_BROWSE_CATEGORIES );
		}
     	
     	/**
     	 * Override the inherited clone() method, but don't return any state.
     	 */
		override public function clone():Event
		{
			return new GetBrowseCategoriesEvent();
		}	
		
	}
}
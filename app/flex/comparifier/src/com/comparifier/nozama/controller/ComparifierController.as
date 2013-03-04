package com.comparifier.nozama.controller
{
	import com.adobe.cairngorm.control.FrontController;
	import com.comparifier.nozama.event.GetBrowseCategoriesEvent;
	import com.comparifier.nozama.command.*;

	public class ComparifierController extends FrontController
	{
		public function ComparifierController()
		{
			initialiseCommands();
		}
		
		public function initialiseCommands():void
		{
			addCommand( GetBrowseCategoriesEvent.EVENT_GET_BROWSE_CATEGORIES, GetBrowseCategoriesCommand );
		}	
		
	}
}
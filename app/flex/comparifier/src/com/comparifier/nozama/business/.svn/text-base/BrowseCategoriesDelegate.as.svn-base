package com.comparifier.nozama.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import mx.controls.Alert;
	
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	public class BrowseCategoriesDelegate
	{
		private var responder:IResponder;
		private var browseService:RemoteObject;
		
		public function BrowseCategoriesDelegate(responder:IResponder)
		{
			this.browseService = ServiceLocator.getInstance().getRemoteObject("browseService");
			this.responder = responder;
		}
		
		public function getBrowseCategories(vendor:String, searchIndex:String, options:Object):void
		{
			var call:Object = browseService.getBrowseCategories.send(vendor, searchIndex, options);
			call.addResponder(responder);
		}

	}
}
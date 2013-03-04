package com.comparifier.nozama.business
{
	import com.comparifier.nozama.vo.CategoryVO;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ICollectionView;
	import mx.rpc.IResponder;
	
	public class BrowseCategoriesDelegateMock extends BaseBusinessDelegateMock
	{
		public function BrowseCategoriesDelegateMock(responder:IResponder){
			super(responder);
			this.Latency=2000;
		}		
		
		public function getBrowseCategories(browseId:String) : void
		{	
			//create the mockup list of items (copied from the java code)
			var browseCategories:ICollectionView = createBrowseCategories(browseId)
			//call async responder
			setResults(browseCategories)		
		}
		
		private function createBrowseCategories(browseId:String):ICollectionView
		{
			var browseCategories:ArrayCollection = new ArrayCollection();
		
			var category:CategoryVO = new CategoryVO();
			category.id = 1;
			category.name = "Books";
			category.description = "So, you need to tell the time of course, but you also need a way to carry your valuable data with you at all times (you know - your MP3 files, favorite images, your ThinkGeek shopping list). This watch can handle the mission for you and do it in style. It can store up to 256 Megs of data." ;
			category.vendorCategoryId = browseId;
			category.operation =  "BrowseNodeLookup" ;
			
			browseCategories.addItem(category);
			
			var category1:CategoryVO = new CategoryVO();
			category1.id = 2;
			category1.name = "Electronics";
			category1.description = "hahahahahahahahahaaaaaa sakldfj lsa faslkfj asdlf." ;
			category1.vendorCategoryId = browseId;
			category1.operation =  "BrowseNodeLookup" ;
			
			browseCategories.addItem(category1);
			
			return browseCategories;
		}
		/* public function BrowseCategoriesDelegate( responder : IResponder )
		{		
			this.service = ServiceLocator.getInstance().getRemoteObject( "browseService" );
			this.responder = responder;
		}
		
		public function getBrowseCategories(browseId:String) : void
		{			
			/*TODO: Need to figure out what the method in Ruby is called and also HOW to pass a variable along using Cairngorm. */
		/* 	var call : Object = service.getBrowseCategories(browseId);
			call.addResponder( responder );
		}
	
		private var responder : IResponder;
		private var service : Object; */

	}
}
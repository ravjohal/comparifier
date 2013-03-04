package com.comparifier.nozama.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.comparifier.nozama.business.BrowseCategoriesDelegate;
	import com.comparifier.nozama.event.GetBrowseCategoriesEvent;
	import com.comparifier.nozama.model.ComparifierModelLocator;
	
	import flash.utils.getQualifiedClassName;
	
	import mx.collections.ICollectionView;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;

	public class GetBrowseCategoriesCommand implements ICommand, IResponder
	{
		public function GetBrowseCategoriesCommand()
		{
		}

		public function execute(event:CairngormEvent):void
		{
			
			/* var sortEvent : SortProductsEvent = SortProductsEvent( event );
	   		
	    	var sortBy : String = sortEvent.sortBy;
	      var model : ShopModelLocator = ShopModelLocator.getInstance();
	      
	      var sort : Sort = new Sort();
      	
      	if ( sortBy == "price" )
      	{
      		sort.fields = [ new SortField( sortBy, false, false, true ) ];     	
      	}
      	else
      	{
      		sort.fields = [ new SortField( sortBy, true ) ];	
      	}
      	
      	model.products.sort = sort;
      	model.products.refresh();
      	
      	model.selectedItem = model.products[ 0 ]; */
			
			var browseEvent:GetBrowseCategoriesEvent = GetBrowseCategoriesEvent(event);
			var browseId:String = browseEvent.browseId;
			var searchIndex:String = browseEvent.searchIndex;
			var vendor:String = browseEvent.vendor;
			var responseGroups:String = browseEvent.responseGroups;
			var operation:String = browseEvent.operation;
			//var model:ComparifierModelLocator = ComparifierModelLocator.getInstance();
			//var delegate:BrowseCategoriesDelegateMock = new BrowseCategoriesDelegateMock( this );
			var delegate:BrowseCategoriesDelegate = new BrowseCategoriesDelegate(this);
			var options:Object = new Object;
			
			//TODO: Generalize the key for the options object/hash. What if some other vendor had GroupsToResponse instead of ResponseGroup...need to make dynamic, according to vendor
			//TODO: Perhaps create a CategoryVO Object and send that along, instead of sending Hash???  Perhaps that will be much faster?
			// Shall I make these Value Object classes?  That way i pass along VOs and not dynamic objects/maps/hashes...
			options["Operation"] = operation;
			options["ResponseGroup"] = responseGroups;
			options["BrowseNodeId"] = browseId;
			//Call the getBrowseCategories method from the delegate class.  The result will get handled by the result function below.
			delegate.getBrowseCategories(vendor, searchIndex, options);
			
			//Alert.show("where am I" + options["BrowseNodeId"] + "      " + searchIndex); 
			//model.browseCategories =  delegate.getBrowseCategories(browseId);

		}
		
		//In this method, set the model
		public function result(data:Object):void
		{
			var className:String = flash.utils.getQualifiedClassName(data.result[0]);
			var categoryVOName:String = "com.comparifier.nozama.vo::CategoryVO";
			var itemVOName:String = "com.comparifier.nozama.vo::ItemVO";
			/* var category:CategoryVO = new CategoryVO();
			category = data.result; */
			//var arr:Array = data.result;
			if(className == categoryVOName)
				Alert.show("CategoryVO: " + className);
			if(className == itemVOName)
				Alert.show("ItemVO: " + className); 
			//var browseCategories:ListCollectionView = ListCollectionView(data.result);
			
			
			var model:ComparifierModelLocator = ComparifierModelLocator.getInstance();
			/* if (data == null)
				Alert.show("In results: " + model.browseCategories.toString());
			else
				Alert.show("hahahahahahaha"); */
			if(className == categoryVOName){
				model.setCategoriesFromVOs(data.result);
				model.workFlowState = ComparifierModelLocator.VIEWING_HOME_PAGE;
			}
			else if(className == itemVOName){
				//var items:ICollectionView = ICollectionView(data.result);
				model.setItemsFromVOs(data.result);
				model.selectedItem = data.result[0];
				model.workFlowState = ComparifierModelLocator.VIEWING_SRP_PAGE;
			}
			else
				Alert.show("Nothing to show!   " + className);
		/* 	// sort the data
			var sort :Sort = new Sort();
		   sort.fields = [ new SortField( "name", true ) ];
		   products.sort = sort;
		   products.refresh();*/
	   
	 	}
		
		public function fault(info:Object):void
		{
			//TODO: NEED TO FIGURE OUT WHAT KIND OF ERROR I RECEIVE WHEN RETURNING ITEMS....
			var faultEvent:FaultEvent = FaultEvent( info );
			Alert.show( "Browse Categories could not be retrieved!" + info.toString());
		}
 
	}
}
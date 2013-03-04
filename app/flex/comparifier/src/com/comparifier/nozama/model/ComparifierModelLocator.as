package com.comparifier.nozama.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	import com.comparifier.nozama.vo.CategoryVO;
	import com.comparifier.nozama.vo.ItemVO;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ICollectionView;
	import mx.collections.ListCollectionView;
	
	[Bindable]
	public class ComparifierModelLocator implements IModelLocator
	{
		private static var modelLocator:ComparifierModelLocator;
      	
      	//Variables
      	//Workflow
      	public static const VIEWING_HOME_PAGE:int = 0;
      	public static const VIEWING_SRP_PAGE:int = 1;
      	public static const VIEWING_CART_PAGE:int = 2;
      	public static const VIEWING_COMPARIFY_PAGE:int = 3;
      	
      	public var workFlowState:int = VIEWING_HOME_PAGE;
      	
		//Where all the Categories for Browse are stored
		public var browseCategories:ListCollectionView;
		
		//The selected item for the model
		public var selectedItem:ItemVO;
      
     	//The items
     	public var items:ICollectionView;
      
      	//Enforces only one instance
      	public static function getInstance():ComparifierModelLocator
      	{
      		if ( modelLocator == null )
      		{
      			modelLocator = new ComparifierModelLocator();
      		}
      		
      		return modelLocator;
      	}
     	
     	//Constructor
		public function ComparifierModelLocator()
		{
			if ( modelLocator != null )
         	{
         		throw new Error( "Only one ComparifierLocator instance should be instantiated" );	
         	}
         	browseCategories = null;
         	selectedItem = null;
		}
		
		public function setItemsFromVOs(itemVOs:Array):void
		{
			var itemsArray:Array = [];
			for each (var item:ItemVO in itemVOs){
				itemsArray.push(Item.fromVO(item));
			}
			items = new ArrayCollection(itemsArray);			
		}
		 
		public function setCategoriesFromVOs(categoryVOs:Array):void
		{
			var categoriesArray:Array = [];
			for each (var category:CategoryVO in categoryVOs){
				categoriesArray.push(Category.fromVO(category));
				//descr += category.description + "  ";
			}
			browseCategories = new ArrayCollection(categoriesArray);
		} 
        
      /* public var selectedItem : ProductVO;	
        
      public var shoppingCart : ShoppingCart;
      
      public var wishList : ShoppingCart; */

	}
}
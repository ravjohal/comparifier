package com.comparifier.nozama.model
{
	import com.comparifier.nozama.vo.CategoryVO;
	import mx.controls.Alert;
	
	public class Category
	{
		[Bindable]
		public var id : Number;
		
		[Bindable]
		public var parentId:String;
			
		[Bindable]
		public var vendorCategoryId : String;
		
		[Bindable]
		public var name : String;
		
		[Bindable]
		public var searchIndex : String;
		
		[Bindable]
		public var description : String;
		
		[Bindable]
		public var operation : String;
		
		[Bindable]
		public var vendor : String;
		
		[Bindable]
		public var parentCategoryId:String;
		
		[Bindable]
		public var parentCategoryName:String; 
		
		[Bindable]
		public var isLeafCategory:Boolean;
		
		[Bindable]
		public var isCategoryRoot:Boolean;
		
		[Bindable]
		public var created_at : Date;
		
		[Bindable]
		public var updated_at : Date;
		
		public function Category(
		id:int = 0, 
		vendorCategoryId:String = "", 
		name:String = "", 
		searchIndex:String = "",
		description:String = "", 
		operation:String = "", 
		vendor:String = "", 
		parentCategoryId:String = "",
		parentCategoryName:String = "",
		created_at:Date = null, 
		updated_at:Date = null)
		{
			this.id = id;
			this.vendorCategoryId = vendorCategoryId;
			this.name = name;
			this.searchIndex = searchIndex;
			this.description = description;
			this.operation = operation;
			this.vendor = vendor;
			this.parentCategoryId = parentCategoryId;
			this.parentCategoryName = parentCategoryName; 
			this.created_at = created_at;
			this.updated_at = updated_at;
		}
		
		public function toVO():CategoryVO
		{
			var categoryVO:CategoryVO = new CategoryVO();
			categoryVO.id = id;
			categoryVO.vendorCategoryId = vendorCategoryId;
			categoryVO.name = name;
			categoryVO.searchIndex = searchIndex;
			categoryVO.description = description;
			categoryVO.operation = operation;
			categoryVO.vendor = vendor;
			categoryVO.parentCategoryId = parentCategoryId;
			categoryVO.parentCategoryName = parentCategoryName; 
			categoryVO.created_at = created_at;
			categoryVO.updated_at = updated_at;
			
			return categoryVO;
		}
		
		public static function fromVO(categoryVO:CategoryVO):Category
		{
			var model:ComparifierModelLocator = ComparifierModelLocator.getInstance();
			
			//Alert.show("Result: " + categoryVO.searchIndex + "    " + categoryVO.name);
			
			return new Category(
			categoryVO.id, 
			categoryVO.vendorCategoryId, 
			categoryVO.name, 
			categoryVO.searchIndex, 
			categoryVO.description, 
			categoryVO.operation, 
			categoryVO.vendor,
			categoryVO.parentCategoryId,
			categoryVO.parentCategoryName,
			categoryVO.created_at, 
			categoryVO.updated_at);
		}

	}
}
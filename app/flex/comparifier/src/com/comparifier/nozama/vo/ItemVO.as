package com.comparifier.nozama.vo
{
	import com.adobe.cairngorm.vo.IValueObject;

	[RemoteClass(alias='com.comparifier.nozama.vo.ItemVO')]
	public class ItemVO implements IValueObject
	{
		//TODO: Get a list of all necessary information an Item will include
		
		[Bindable]
		public var id : Number;
			
		[Bindable]
		public var vendorItemId : String;
		
		[Bindable]
		public var name : String;
		
		[Bindable]
		public var description : String;
		
		[Bindable]
		public var operation : String;
		
		[Bindable]
		public var vendor : String;

		[Bindable]
		public var detailPageURL : String;
		
		[Bindable]
		public var salesRank : String;
		
		[Bindable]
		public var lowestNewPrice : String;		

		[Bindable]
		public var lowestUsedPrice : String;
		
		[Bindable]
		public var lowestRefurbishedPrice : String;
		
		[Bindable]
		public var totalNew : Number;
		
		[Bindable]
		public var totalUsed : Number;
		
		[Bindable]
		public var totalRefurbished : Number;
		
		[Bindable]
		public var totalCollectible : Number;
		
		[Bindable]
		public var totalOffers : Number;
		
		[Bindable]
		public var totalOfferPages : Number;
		
		[Bindable]
		public var listPrice : String;
		
		[Bindable]
		public var offerPrice : String;
		
		[Bindable]
		public var avgCustRating : String;
		
		[Bindable]
		public var totalReviews : Number;
		
		[Bindable]
		public var totalReviewPages : Number;
		
		[Bindable]
		public var created_at : Date;
		
		[Bindable]
		public var updated_at : Date;
		
		[Bindable]
		public var images:Array = new Array;
		
		[Bindable]
		public var itemAttributes:Array = new Array;
		
		[Bindable]
		public var offers:Array = new Array;
		
		[Bindable]
		public var offerSummaries:Array = new Array;
		
		[Bindable]
		public var customerServices:Array = new Array;
		
		[Bindable]
		public var editorialReviews:Array = new Array;
		
		[Bindable]
		public var categories:Array = new Array;
		
		[Bindable]
		public var similarProducts:Array = new Array;
		
		[Bindable]
		public var accessories:Array = new Array;
		
		[Bindable]
		public var listmanias:Array = new Array;
		
	}
}
package com.comparifier.nozama.model
{
	import com.comparifier.nozama.vo.ItemVO;
	
	public class Item
	{
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

				
		public function Item(id:int = 0,
		vendorItemId:String = "",
		name:String = "",
		description:String = "",
		operation:String = "",
		vendor:String = "",
		detailPageURL:String = "",
		salesRank:String = "",
		lowestNewPrice:String = "",
		lowestUsedPrice:String = "",
		lowestRefurbishedPrice:String = "",
		totalNew:int = 0,
		totalUsed:int = 0,
		totalRefurbished:int = 0,
		totalCollectible:int = 0,
		totalOffers:int = 0,
		totalOfferPages:int = 0,
		listPrice:String = "",
		offerPrice:String = "",
		avgCustRating:String = "",
		totalReviews:int = 0,
		totalReviewPages:int = 0,
		created_at:Date = null, 
		updated_at:Date = null,
		images:Array = null,
		itemAttributes:Array = null,
		offers:Array = null,
		offerSummaries:Array = null,
		customerServices:Array = null,
		editorialReviews:Array = null,
		categories:Array = null,
		similarProducts:Array = null,
		accessories:Array = null,
		listmanias:Array = null)
		{
			this.id = id;
			this.vendorItemId = vendorItemId;
			this.name = name;
			this.description = description;
			this.operation = operation;
			this.vendor = vendor;
			this.detailPageURL = detailPageURL;
			this.salesRank = salesRank;
			this.lowestNewPrice = lowestNewPrice;
			this.lowestUsedPrice = lowestUsedPrice;
			this.lowestRefurbishedPrice = lowestRefurbishedPrice;
			this.totalNew = totalNew;
			this.totalUsed = totalUsed;
			this.totalRefurbished = totalRefurbished;
			this.totalCollectible = totalCollectible;
			this.totalOffers = totalOffers;
			this.totalOfferPages = totalOfferPages;
			this.listPrice = listPrice;
			this.offerPrice = offerPrice;
			this.avgCustRating = avgCustRating;
			this.totalReviews = totalReviews;
			this.totalReviewPages = totalReviewPages;
			this.created_at = created_at; 
			this.updated_at = updated_at;
			this.images = images;
			this.itemAttributes = itemAttributes;
			this.offers = offers;
			this.offerSummaries = offerSummaries;
			this.customerServices = customerServices;
			this.editorialReviews = editorialReviews;
			this.categories = categories;
			this.similarProducts = similarProducts;
			this.accessories = accessories;
			this.listmanias = listmanias;
		}
		
		public function toVO():ItemVO
		{
			var itemVO:ItemVO = new ItemVO();
			itemVO.id = id;
			itemVO.vendorItemId = vendorItemId;
			itemVO.name = name;
			itemVO.description = description;
			itemVO.operation = operation;
			itemVO.vendor = vendor;
			itemVO.detailPageURL = detailPageURL;
			itemVO.salesRank = salesRank;
			itemVO.lowestNewPrice = lowestNewPrice;
			itemVO.lowestUsedPrice = lowestUsedPrice;
			itemVO.lowestRefurbishedPrice = lowestRefurbishedPrice;
			itemVO.totalNew = totalNew;
			itemVO.totalUsed = totalUsed;
			itemVO.totalRefurbished = totalRefurbished;
			itemVO.totalCollectible = totalCollectible;
			itemVO.totalOffers = totalOffers;
			itemVO.totalOfferPages = totalOfferPages;
			itemVO.listPrice = listPrice;
			itemVO.offerPrice = offerPrice;
			itemVO.avgCustRating = avgCustRating;
			itemVO.totalReviews = totalReviews;
			itemVO.totalReviewPages = totalReviewPages;
			itemVO.created_at = created_at; 
			itemVO.updated_at = updated_at;
			itemVO.images = images;
			itemVO.itemAttributes = itemAttributes;
			itemVO.offers = offers;
			itemVO.offerSummaries = offerSummaries;
			itemVO.customerServices = customerServices;
			itemVO.editorialReviews = editorialReviews;
			itemVO.categories = categories;
			itemVO.similarProducts = similarProducts;
			itemVO.accessories = accessories;
			itemVO.listmanias = listmanias;
			
			return itemVO;
		}
		
		public static function fromVO(itemVO:ItemVO):Item
		{
			
			return new Item(itemVO.id,
			itemVO.vendorItemId,
			itemVO.name,
			itemVO.description,
			itemVO.operation,
			itemVO.vendor,
			itemVO.detailPageURL,
			itemVO.salesRank,
			itemVO.lowestNewPrice,
			itemVO.lowestUsedPrice,
			itemVO.lowestRefurbishedPrice,
			itemVO.totalNew,
			itemVO.totalUsed,
			itemVO.totalRefurbished,
			itemVO.totalCollectible,
			itemVO.totalOffers,
			itemVO.totalOfferPages,
			itemVO.listPrice,
			itemVO.offerPrice,
			itemVO.avgCustRating,
			itemVO.totalReviews,
			itemVO.totalReviewPages,
			itemVO.created_at, 
			itemVO.updated_at,
			itemVO.images,
			itemVO.itemAttributes,
			itemVO.offers,
			itemVO.offerSummaries,
			itemVO.customerServices,
			itemVO.editorialReviews,
			itemVO.categories,
			itemVO.similarProducts,
			itemVO.accessories,
			itemVO.listmanias);
		}
	}
}
require 'rubygems'
require 'rexml/document'

class Item < ActiveRecord::Base
  has_many :comparifier_attributes
  belongs_to :category
  has_many :images
  has_many :similar_products
  has_many :search_bin_sets
  has_many :customer_reviews
  has_many :editorial_reviews
  has_many :offers
  has_many :listmanias
  has_many :accessories

  
  def extract_items(items_response)
    items_container = []
    items_response.response.items.each{|items|
    
  #  log = Logger.new('../log/debug.log')
 #   log.debug "\n Item Name: " + items.asin.to_s
      title = ""
      listPrice = 0
      #Since the calls are dynamic, i need to handle the noMethodError
#      begin
            #this is where the item attribute class's method should be called???
          title = items.item_attributes.title.to_s
          
          #List Price is not always there, which sucks...so rescue it...
          listPrice = items.item_attributes.list_price.formatted_price rescue NoMethodError
          
          item = Item.new
          item.vendorItemId = items.asin
          item.name = title.to_s
          item.description = items.asin + "  " + title.to_s
          item.operation = "ItemSearch"
          item.vendor = "Amazon"
          item.detailPageURL = items.detail_page_url
          item.totalNew = items.offer_summary.total_new rescue NoMethodError
          item.totalUsed = items.offer_summary.total_used rescue NoMethodError
          item.totalRefurbished = items.offer_summary.total_refurbished rescue NoMethodError
          item.totalCollectible = items.offer_summary.total_collectible rescue NoMethodError
          item.totalOffers = items.offers.total_offers rescue NoMethodError
          item.totalOfferPages = items.offers.total_offer_pages rescue NoMethodError
          item.listPrice = listPrice
          item.offerPrice = 0
          item.avgCustRating = items.customer_reviews.average_rating rescue NoMethodError
          item.totalReviews = items.customer_reviews.total_reviews rescue NoMethodError
          item.totalReviewPages = items.customer_reviews.total_review_pages rescue NoMethodError
          item.lowestNewPrice = items.offer_summary.lowest_new_price.formatted_price rescue NoMethodError
          item.lowestUsedPrice = items.offer_summary.lowest_used_price.formatted_price rescue NoMethodError
          item.lowestRefurbishedPrice = items.offer_summary.lowest_refurbished_price.formatted_price rescue NoMethodError
          #item.save!
          
          image = Image.new
          image.type = "image1"
          item.images << image
#TODO: TOOK OUT item_attribute CLASS FOR NOW...IT WASN'T WORKING FOR SOME REASON, PROBABLY NEED TO MAKE IT SINGULAR...  
#          item_attribute = ItemAttributes.new
#          item_attribute.amount = "3.44"
#          item.item_attributes << item_attribute
          
          offer = Offer.new
          offer.price = "4.56"
          item.offers << offer
          
          listmania = Listmania.new
          listmania.listName = "listmania 1"
          item.listmanias << listmania
          
          sbs = SearchBinSet.new
          sbs.narrowBy = "narrowByThis"
          item.search_bin_sets << sbs
          
          accessory = Accessory.new
          accessory.itemID = "Accessory 1"
          item.accessories << accessory
          
          customer_review = CustomerReview.new
          customer_review.rating = "4.5"
          item.customer_reviews << customer_review
          
          editorial = EditorialReview.new
          editorial.source = "company"
          item.editorial_reviews << editorial
          
          #TODO: similar_product.title doesn't work because for some reason in the migration, t.String was used instead of t.string to create column
          similar_product = SimilarProduct.new
          similar_product.itemID = "similar product 1"
          item.similar_products << similar_product
          
          items_container.push(item)
          
#        rescue NoMethodError
         log.debug "DONE! " + items_container[0].to_s + "\n"
#          next
#      end
    }
      items_container
 end
  
end

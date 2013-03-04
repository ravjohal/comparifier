class AddColumnsToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :detailPageURL, :string
    add_column :items, :salesRank, :string
    add_column :items, :lowestNewPrice, :string
    add_column :items, :lowestUsedPrice, :string
    add_column :items, :lowestRefurbishedPrice, :string
    add_column :items, :totalNew, :integer
    add_column :items, :totalUsed, :integer
    add_column :items, :totalRefurbished, :integer
    add_column :items, :totalCollectible, :integer
    add_column :items, :totalOffers, :integer
    add_column :items, :totalOfferPages, :integer
    add_column :items, :listPrice, :string
    add_column :items, :offerPrice, :string
    add_column :items, :avgCustRating, :string
    add_column :items, :totalReviews, :integer
    add_column :items, :totalReviewPages, :integer
  end

  def self.down
    remove_column :items, :detailPageURL
    remove_column :items, :salesRank
    remove_column :items, :lowestNewPrice
    remove_column :items, :lowestUsedPrice
    remove_column :items, :lowestRefurbishedPrice
    remove_column :items, :totalNew
    remove_column :items, :totalUsed
    remove_column :items, :totalRefurbished
    remove_column :items, :totalCollectible
    remove_column :items, :totalOffers
    remove_column :items, :totalOfferPages
    remove_column :items, :listPrice
    remove_column :items, :offerPrice
    remove_column :items, :avgCustRating
    remove_column :items, :totalReviews
    remove_column :items, :totalReviewPages
  end
end

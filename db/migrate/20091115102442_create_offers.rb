class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.string :merchantID
      t.string :glancePage
      t.string :condition
      t.string :subCondition
      t.string :price
      t.string :availability
      t.string :eligibleforSavingShipping
      t.string :offerListingID

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end

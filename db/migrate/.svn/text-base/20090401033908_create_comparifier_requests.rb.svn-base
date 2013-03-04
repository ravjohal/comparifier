class CreateComparifierRequests < ActiveRecord::Migration
  def self.up
    create_table :comparifier_requests do |t|
      t.string :vendorRequestId
      t.string :vendor #Amazon for now, but later on, eBay Yahoo perhaps??
      t.string :operation
      t.string :service
      t.string :accessKeyId
      t.string :responseType #whether it is XML or of another type
      t.string :responseGroup #Large, Medium, BrowseNode, etc..
      t.string :version
      t.string :keywords
      t.text :response, :limit => 429496729
      t.text :request
      t.date :requestDate
      t.string :totalResults
      t.string :totalPages
      t.string :condition #what condition, according to request
      t.string :reviewSort #what request was sorting defined for
      t.string :merchantId
      

      t.timestamps
    end
  end

  def self.down
    drop_table :comparifier_requests
  end
end

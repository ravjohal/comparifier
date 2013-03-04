class CreateCustomerReviews < ActiveRecord::Migration
  def self.up
    create_table :customer_reviews do |t|
      t.string :itemID
      t.string :rating
      t.integer :helpfulVotes
      t.integer :totalVotes
      t.string :customerID
      t.string :date
      t.string :summary
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_reviews
  end
end

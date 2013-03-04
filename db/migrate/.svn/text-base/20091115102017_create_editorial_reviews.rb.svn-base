class CreateEditorialReviews < ActiveRecord::Migration
  def self.up
    create_table :editorial_reviews do |t|
      t.string :source
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :editorial_reviews
  end
end

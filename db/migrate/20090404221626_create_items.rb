class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :vendorItemId #for Amazon, this is most likely ASIN
      t.string :name
      t.string :description
      t.string :operation
      t.string :vendor

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end

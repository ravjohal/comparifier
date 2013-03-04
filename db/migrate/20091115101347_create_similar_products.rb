class CreateSimilarProducts < ActiveRecord::Migration
  def self.up
    create_table :similar_products do |t|
      t.string :itemID
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :similar_products
  end
end

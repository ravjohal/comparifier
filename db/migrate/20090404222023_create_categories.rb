class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :vendorCategoryId
      t.string :name
      t.text :description
      t.string :operation
      t.string :vendor

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end

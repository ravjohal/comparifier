class CreateComparifierAttributes < ActiveRecord::Migration
  def self.up
    create_table :comparifier_attributes do |t|
      t.string :name
      t.text :value
      t.references :category
      t.references :item

      t.timestamps
    end
  end

  def self.down
    drop_table :comparifier_attributes
  end
end

class CreateListmanias < ActiveRecord::Migration
  def self.up
    create_table :listmanias do |t|
      t.string :listID
      t.string :listName

      t.timestamps
    end
  end

  def self.down
    drop_table :listmanias
  end
end

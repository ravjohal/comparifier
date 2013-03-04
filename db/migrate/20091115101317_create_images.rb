class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :type
      t.string :url
      t.string :height
      t.string :width

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end

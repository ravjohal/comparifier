class CreateBins < ActiveRecord::Migration
  def self.up
    create_table :bins do |t|
      t.string :name
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :bins
  end
end

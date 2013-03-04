class CreateChildrens < ActiveRecord::Migration
  def self.up
    create_table :childrens do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :childrens
  end
end

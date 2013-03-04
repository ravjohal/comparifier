class CreateBinParamaters < ActiveRecord::Migration
  def self.up
    create_table :bin_paramaters do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :bin_paramaters
  end
end

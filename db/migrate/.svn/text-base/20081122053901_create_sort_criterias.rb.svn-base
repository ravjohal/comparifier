class CreateSortCriterias < ActiveRecord::Migration
  def self.up
    create_table :sort_criterias do |t|
      t.string :name, :null => false, :unique => true
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :sort_criterias
  end
end

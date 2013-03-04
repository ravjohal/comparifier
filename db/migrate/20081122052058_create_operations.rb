class CreateOperations < ActiveRecord::Migration
  def self.up
    create_table :operations do |t|
      t.string :name, :null => false, :unique => true
      t.text :description

      t.timestamps
    end

    create_table (:operations_parameters, :id => false) do |t|
      t.integer :parameter_id, :null=> false
      t.integer :operation_id, :null=> false

      t.timestamps
    end

    create_table (:operations_response_groups, :id => false) do |t|
      t.integer :response_group_id, :null=> false
      t.integer :operation_id, :null=> false

      t.timestamps
    end
end

  def self.down
    drop_table :operations
    drop_table :operations_parameters
    drop_table :operations_response_groups
  end
end

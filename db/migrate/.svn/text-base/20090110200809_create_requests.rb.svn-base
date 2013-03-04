class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.string :version
      t.string :keyword
      t.string :service
      t.string :request_url
      t.string :aws_access_key_id
      t.string :constant_url

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end

class AddLongitudeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :longitude, :float
    remove_column :users, :ip_address
  end
end

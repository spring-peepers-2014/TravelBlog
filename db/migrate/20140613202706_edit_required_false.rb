class EditRequiredFalse < ActiveRecord::Migration
  def change
    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name, :string, null: false
    change_column :users, :email, :string, null: false
    change_column :users, :password_digest, :string, null: false
    change_column :location_pins, :latitude, :float, null: false
    change_column :location_pins, :longitude, :float, null: false
    change_column :posts, :title, :string, null: false
    change_column :posts, :body, :string, null: false
    change_column :photos, :url, :string, null: false
    change_column :maps, :name, :string, null: false
  end
end

class EditFieldValidations < ActiveRecord::Migration
  def change
    change_column :locations, :name, :string, null: false
    change_column :locations, :latitude, :float, null: false
    change_column :locations, :longitude, :float, null: false
  end
end

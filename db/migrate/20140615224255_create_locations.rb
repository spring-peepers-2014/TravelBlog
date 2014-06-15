class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, :required => true
      t.float :latitude, :required => true
      t.float :longitude, :required => true
      t.timestamps
    end
  end
end

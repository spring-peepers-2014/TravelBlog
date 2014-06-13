class CreateLocationPins < ActiveRecord::Migration
  def change
    create_table :location_pins do |t|
      t.string :location_name
      t.float :latitude, :required => true
      t.float :longitude, :required => true
      t.belongs_to :map
      t.belongs_to :trip
      t.timestamps
    end
  end
end

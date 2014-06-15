class RemoveMapReferenceAndRemoveAttributes < ActiveRecord::Migration
  def change
    change_table :location_pins do |t|
        t.belongs_to :location
        t.remove_belongs_to :map
        t.remove :location_name
        t.remove :latitude
        t.remove :longitude
    end
  end
end
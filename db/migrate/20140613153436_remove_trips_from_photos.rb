class RemoveTripsFromPhotos < ActiveRecord::Migration
  def up
    remove_reference :photos, :trip
  end

  def down
    add_reference :photos, :trip
  end
end
class RemoveTripsFromPosts < ActiveRecord::Migration
  def up
    remove_reference :posts, :trip
  end

  def down
    add_reference :posts, :trip
  end
end
class RemoveMapReferenceToUser < ActiveRecord::Migration
  def up
    remove_reference :maps, :user
  end

  def down
    add_reference :maps, :user
  end
end

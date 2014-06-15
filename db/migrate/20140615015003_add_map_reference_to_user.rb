class AddMapReferenceToUser < ActiveRecord::Migration
  def change
    add_reference :maps, :user
  end
end

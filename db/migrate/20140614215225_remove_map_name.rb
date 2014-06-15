class RemoveMapName < ActiveRecord::Migration
  def change
    remove_column :maps, :name
  end
end

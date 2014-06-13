class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    t.string :title
    t.belongs_to :user
    t.timestamps
    end
  end
end

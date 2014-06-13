class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    t.string :title, :required => true
    t.belongs_to :user
    t.timestamps
    end
  end
end

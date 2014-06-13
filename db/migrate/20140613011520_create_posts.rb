class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :required => true
      t.text :body, :required => true
      t.belongs_to :location_pin
      t.belongs_to :trip
      t.timestamps
    end
  end
end

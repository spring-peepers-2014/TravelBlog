class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url, :required => true
      t.belongs_to :location_pin
      t.belongs_to :trip
      t.timestamps
    end
  end
end

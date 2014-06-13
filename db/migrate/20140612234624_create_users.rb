class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :required => true
      t.string :last_name, :required => true
      t.string :email, :required => true
      t.string :password_digest, :required => true
      t.timestamps
    end
  end
end

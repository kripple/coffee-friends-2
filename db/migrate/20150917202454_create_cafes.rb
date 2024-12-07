class CreateCafes < ActiveRecord::Migration[8.0]
  def change
    create_table :cafes do |t|
      t.string :email, null: false, limit: 50
      t.string :name, null: false, limit: 50
      t.string :address, null: false, limit: 150
      t.string :password_digest, null: false
      t.string :borough
      t.string :neighborhood
      t.timestamps
    end
  end
end

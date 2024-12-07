class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, limit: 25
      t.string :last_name, null: false, limit: 25
      t.string :username, null: false, limit: 50
      t.string :email, null: false, limit: 50
      t.string :phone, null: false
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end

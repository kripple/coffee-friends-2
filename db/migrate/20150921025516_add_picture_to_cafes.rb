class AddPictureToCafes < ActiveRecord::Migration[8.0]
  def change
    add_column :cafes, :picture, :string
  end
end

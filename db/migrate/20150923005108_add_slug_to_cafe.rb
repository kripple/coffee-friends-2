class AddSlugToCafe < ActiveRecord::Migration[8.0]
  def change
    add_column :cafes, :slug, :string
  end
end

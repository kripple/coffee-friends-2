class AddSlugToCoffeeGift < ActiveRecord::Migration[8.0]
  def change
    add_column :coffee_gifts, :slug, :string
  end
end

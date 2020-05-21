class RemoveStarsFromRestaurants < ActiveRecord::Migration[6.0]
  def change

    remove_column :restaurants, :stars, :integer
  end
end

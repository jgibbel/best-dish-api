class AddBoroughtoRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :borough, :string
  end
end

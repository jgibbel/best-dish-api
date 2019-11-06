class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :address
      t.string :longitude
      t.string :latitude
      t.string :category

      t.timestamps
    end
  end
end

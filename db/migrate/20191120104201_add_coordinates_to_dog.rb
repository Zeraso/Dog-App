class AddCoordinatesToDog < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :latitude, :float
    add_column :dogs, :longitude, :float
  end
end

class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :race
      t.integer :age
      t.string :coat
      t.boolean :available, default: false

      t.timestamps
    end
  end
end

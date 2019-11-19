class ChangeDogRows < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :gender, :string
    rename_column :dogs, :race, :breed
    rename_column :dogs, :age, :birthday
  end
end

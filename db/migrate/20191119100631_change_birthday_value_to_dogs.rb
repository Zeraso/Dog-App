class ChangeBirthdayValueToDogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :birthday
    add_column :dogs, :birthday, :date
  end
end

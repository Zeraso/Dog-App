class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.date :date
      t.text :comment
      t.string :status
      t.integer :rating
      t.references :dog

      t.timestamps
    end
  end
end

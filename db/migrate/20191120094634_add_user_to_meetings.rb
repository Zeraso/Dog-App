class AddUserToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_reference :meetings, :user, foreign_key: true
  end
end

class Dog < ApplicationRecord
  belongs_to :user
  has_many :meetings
  has_many_attached :photos

  validates :name, presence: true
  validates :birthday, presence: true
  validates :breed, presence: true
  validates :coat, presence: true
  validates :gender, presence: true
  validates :photos, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_user_id?

  def address
    user.address
  end
end

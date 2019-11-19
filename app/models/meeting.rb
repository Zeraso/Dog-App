class Meeting < ApplicationRecord
  belongs_to :dog
  belongs_to :user

  validates :date, presence: true
  validates :comment, presence: true
  validates :status, presence: true
  validates :rating, presence: true
end

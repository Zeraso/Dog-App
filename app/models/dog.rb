class Dog < ApplicationRecord
  belongs_to :user
  has_many :meetings

  validates :name, presence: true
  validates :birthday, presence: true
  validates :breed, presence: true
  validates :coat, presence: true
  validates :gender, presence: true
end

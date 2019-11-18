class Dog < ApplicationRecord
  belongs_to :user
  has_many :meetings

  validates :name, presence: true
  validates :age, presence: true, inclusion: { in: (0..20) }, numericality: { only_integer: true }
  validates :race, presence: true
  validates :coat, presence: true
end

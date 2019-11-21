class User < ApplicationRecord
  has_many :dogs, dependent: :destroy
  has_many :meetings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :address, presence: true
end

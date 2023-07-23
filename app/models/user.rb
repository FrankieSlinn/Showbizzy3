class User < ApplicationRecord
  has_many :shows, dependent: :destroy
  has_many :userreviews, dependent: :destroy
  validates :username, presence: true
  

  # attr_accessor :username, :is_performer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end

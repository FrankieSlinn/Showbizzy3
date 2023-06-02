class Show < ApplicationRecord
  belongs_to :user

has_many :reviews, dependent: :destroy
  has_many :places, dependent: :destroy
  has_one_attached :imageup
  
 
  accepts_nested_attributes_for :places


 
  attr_accessor :current_user
end

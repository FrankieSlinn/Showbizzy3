class Show < ApplicationRecord
  belongs_to :user


  has_many :places, dependent: :destroy
  has_one_attached :image
  
 
  accepts_nested_attributes_for :places


 
  attr_accessor :current_user
end

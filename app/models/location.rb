class Location < ApplicationRecord
  belongs_to :user
  has_many :shows, through: :datelocs
end

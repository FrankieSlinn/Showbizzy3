class Place < ApplicationRecord
  belongs_to :show
  has_many :timings, dependent: :destroy
  accepts_nested_attributes_for :timings
end

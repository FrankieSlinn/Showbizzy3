class Show < ApplicationRecord
  belongs_to :user
  attr_accessor :current_user
end

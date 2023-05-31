class DateVenue < ApplicationRecord
  belongs_to :show
  belongs_to :location
end

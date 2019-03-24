class Meeting < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :time, presence: true
end

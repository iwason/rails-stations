class Movie < ApplicationRecord
  validates :name, presence: true
  validates :is_showing, inclusion: { in: [true, false] }
end

class Artist < ApplicationRecord
  has_many :songs
  
  validates :name,        presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 500 }
end

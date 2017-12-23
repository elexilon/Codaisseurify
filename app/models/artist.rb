class Artist < ApplicationRecord
  has_many :songs
  has_one :photo

  validates :name,        presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 500 }
end

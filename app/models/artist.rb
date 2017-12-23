class Artist < ApplicationRecord
  has_many  :songs, dependent: :destroy
  has_one   :photo, dependent: :destroy

  validates :name,        presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 500 }

  def self.order_by_name(direction = "asc")
    order("name #{direction}")
  end


end

class Artist < ApplicationRecord
  has_many  :songs, dependent: :destroy
  has_one   :photo, dependent: :destroy

  validates :name,        presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 500 }

  ORDER_BY_TYPE = ["name asc","name desc","created_at asc","created_at desc"]

  def self.order_by_name_or_create(order_by_type = "0")
    order_by_type = "0" if order_by_type.nil?
    order(ORDER_BY_TYPE[order_by_type.to_i-1])
  end

end

class Home < ApplicationRecord
  belongs_to :record


  #validates :post_number, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #validates :area, numericality: {other_than: 1, message: "can't be blank"}
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :shipping_day
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "を入力してください"} 
  validates :situation_id, numericality: { other_than: 1 , message: "を入力してください"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "を入力してください"} 
  validates :area_id, numericality: { other_than: 1 , message: "を入力してください"} 
  validates :shipping_day_id, numericality: { other_than: 1 , message: "を入力してください"} 
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 9999999}

  belongs_to :user
  has_one    :record
  has_many :comments

  def self.search(search)
    if search != ""
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end

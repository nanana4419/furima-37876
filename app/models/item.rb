class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :shipping_day

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
end

class RecordHome
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :city, :house_number, :bilding_name, :phone_number, :record, :user_id, :item_id, :token

  validates :token, presence: true
  with_options presence: true do
    validates :user_id
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true
  validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid."}

  def save
    # 購入情報を保存し、変数recordに代入する
    @record = Record.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    #binding.pry
    Home.create(post_number: post_number, area_id: area_id, city: city, house_number: house_number, bilding_name: bilding_name, phone_number: phone_number, record_id: @record.id)
  end
end
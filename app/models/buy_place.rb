class BuyPlace
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :sender_id, :street, :address, :building_name, :phone, :buy_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :sender_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :street
    validates :address
    validates :phone, format: { with: /\A[0-9]{10,11}\z/ }
    validates :token
  end
  def save
    buy = Buy.create(item_id: item_id, user_id: user_id, token: token)
    Place.create(post_code: post_code, sender_id: sender_id, street: street, address: address, building_name: building_name,
                 phone: phone, buy_id: buy.id)
  end
end

class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:condition,:delivery_charge,:sender,:number_day

  validates    :name,             presence: true
  validates    :price,            presence: true
  validates    :item_text,        presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :deliverycharge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sender_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :numberday_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :user, numericality: { other_than: 1 , message: "can't be blank"}
end

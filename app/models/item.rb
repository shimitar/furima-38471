class Item < ApplicationRecord
  belongs_to :user
  has_one    :buy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :sender
  belongs_to :number_day

  validates :image, presence: true
  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    presence: true
  validates :item_text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :sender_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :number_day_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items

  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :kanji_lastname
    validates :kanji_firstname
  end

  with_options presence: true, format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/ } do
    validates :katakana_lastname
    validates :katakana_firstname
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  validates :birthday, presence: true
end

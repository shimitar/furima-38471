require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    context '商品が登録できる場合' do
      it '全ての項目が記述されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が登録できない場合' do
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end     
      it 'ユーザーが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '商品の画像がなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end
      it '商品の値段が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it'価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が300円未満では出品できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = '999999999999'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '商品のカテゴリーが空では登録できない' do
        @item.category_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空では登録できない' do
        @item.condition_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が空では登録できない' do
        @item.delivery_charge_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元の地域が空では登録できない' do
        @item.sender_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end
      it '発送までの日数が空では登録できない' do
        @item.number_day_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Number day can't be blank")
      end
    end
  end
end

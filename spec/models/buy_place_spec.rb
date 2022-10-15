require 'rails_helper'

RSpec.describe BuyPlace, type: :model do
  describe '購入情報の保存' do
    before do
    @buy_place = FactoryBot.build(:buy_place)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@buy_place).to be_valid
      end
      it '建物名は空でも保存できる' do
        @buy_place.building_name = ''
        expect(@buy_place).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @buy_place.post_code = ''
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できない' do
        @buy_place.post_code = '1234567'
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと保存できない' do
        @buy_place.sender_id = 1
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("Sender can't be blank")
      end
      it '市区町村を選択していないと保存できない' do
        @buy_place.street = ''
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("Street can't be blank")
      end
      it '番地を選択していないと保存できない' do
        @buy_place.address = ''
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @buy_place.phone = nil
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が9桁では保存できない' do
        @buy_place.phone = "090123456"
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が12桁では保存できない' do
        @buy_place.phone = "090123456789"
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が全角数字では保存できない' do
        @buy_place.phone = "０９０１２３４５６７"
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("Phone is invalid")
      end
      it '商品が紐付いていないと保存できないこと' do
        @buy_place.item_id = nil
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("Item can't be blank")
      end
        it "tokenが空では保存できない" do
          @buy_place.token = nil
          @buy_place.valid?
          expect(@buy_place.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end

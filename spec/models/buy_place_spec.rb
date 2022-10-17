require 'rails_helper'

RSpec.describe BuyPlace, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_place = FactoryBot.build(:buy_place, item_id: item.id, user_id: user.id)
      sleep(1)
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
        expect(@buy_place.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は不正な値です")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できない' do
        @buy_place.post_code = '1234567'
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県を選択していないと保存できない' do
        @buy_place.sender_id = 1
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("都道府県を入力してください")
      end
      it '市区町村を選択していないと保存できない' do
        @buy_place.street = ''
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地を選択していないと保存できない' do
        @buy_place.address = ''
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと保存できない' do
        @buy_place.phone = nil
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("電話番号を入力してください", "電話番号は不正な値です")
      end
      it '電話番号が9桁では保存できない' do
        @buy_place.phone = '090123456'
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号が12桁では保存できない' do
        @buy_place.phone = '090123456789'
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号が全角数字では保存できない' do
        @buy_place.phone = '０９０１２３４５６７'
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '商品が紐付いていないと保存できないこと' do
        @buy_place.item_id = nil
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("商品を入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @buy_place.user_id = nil
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("ユーザーを入力してください")
      end
      it 'tokenが空では保存できない' do
        @buy_place.token = nil
        @buy_place.valid?
        expect(@buy_place.errors.full_messages).to include("トークンを入力してください")
      end
    end
  end
end

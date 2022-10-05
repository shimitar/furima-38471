require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

     describe 'ユーザー新規登録' do
        it "全ての項目の入力が存在すれば登録できる" do
          expect(@user).to be_valid
        end

      context '新規登録できない場合' do
        it "nicknameがない場合は登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
  
        it "emailがない場合は登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it "passwordがない場合は登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
  
          it 'passwordとpassword_confirmationが不一致では登録できない' do
            @user.password = '123456'
            @user.password_confirmation = '1234567'
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが5文字以下では登録できない' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
  
        it 'passwordが129文字以上では登録できない' do
          @user.password =  Faker::Internet.password(min_length: 129)
          @user.password_confirmation =  @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
        end
  
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "kanji_lastnameがない場合は登録できない" do
          @user.kanji_lastname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kanji lastname can't be blank")
        end
  
        it "kanji_firstnameがない場合は登録できない" do
          @user.kanji_firstname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kanji firstname can't be blank")
        end
  
        it "katakana_lastnameがない場合は登録できない" do
          @user.katakana_lastname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Katakana lastname can't be blank")
        end
  
        it "katakana_firstnameがない場合は登録できない" do
          @user.katakana_firstname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Katakana firstname can't be blank")
        end

       
        it 'kanji_lastnameが全角入力でなければ登録できない' do
          @user.kanji_lastname = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Kanji lastname is invalid")
        end
  
        it 'kanji_firstnameが全角入力でなければ登録できない' do
          @user.kanji_firstname = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Kanji firstname is invalid")
        end
  
        it 'katakana_lastnameが全角カタカナでなければ登録できない' do
          @user.katakana_lastname = "あいうえお"
          @user.valid?
          expect(@user.errors.full_messages).to include("Katakana lastname is invalid")
        end
  
        it 'katakana_firstnameが全角カタカナでなければ登録できない' do
          @user.katakana_firstname = "あいうえお"
          @user.valid?
          expect(@user.errors.full_messages).to include("Katakana firstname is invalid")
        end

        it "birthdayがない場合は登録できない" do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
end

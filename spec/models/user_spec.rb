require 'rails_helper'
 RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

   describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
     it "nicknameが空だと登録できない" do
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
     end
     it 'emailは一意性出ないと登録できない' do
      binding.pry
     end
     it "passwordが空だと登録できない" do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'passwordが5文字以下では登録できない' do
       @user.password = 'a1234'
       @user.password_confirmation = 'a1234'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
     it 'passwordとpassword_confirmationが不一致では登録できない' do
       @user.password = 'a12345'
       @user.password_confirmation = 'a123456'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "passwordは英数字混合でないと登録できない" do
       @user.password = '000000'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it "last_nameが空だと登録できない" do 
      @user.last_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it "first_nameが空だと登録できない" do  
      @user.first_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end
     it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it "birthdayが空だと登録できない" do 
      @user.birthday = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
    end
   end
 end
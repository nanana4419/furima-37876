require 'rails_helper'
 RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

   describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end


    context '新規登録できないとき' do
     it "nicknameが空では登録できない" do
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
     end

     it "emailが空では登録できない" do
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
     end
     it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
     end
     it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
     end

     it "passwordが空だと登録できない" do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("パスワードを入力してください")
     end
     it 'passwordが5文字以下では登録できない' do
       @user.password = 'a1234'
       @user.password_confirmation = 'a1234'
       @user.valid?
       expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
     end
     it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
     end
     it '数字のみのパスワードでは登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
     end
     it '全角文字を含むパスワードでは登録できない' do
      @user.password = "a１２３４５"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
     end
     it 'passwordとpassword_confirmationが不一致では登録できない' do
       @user.password = 'a12345'
       @user.password_confirmation = 'a123456'
       @user.valid?
       expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
     end

     it "last_nameが空だと登録できない" do 
      @user.last_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("姓名を入力してください")
     end
     it 'last_name（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include("姓名に全角文字を使用してください")
     end
     it "first_nameが空だと登録できない" do  
      @user.first_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
     end
     it 'first_name（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'ﾊｼﾞﾒ'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前に全角文字を使用してください")
     end

     it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("姓名（カナ）を入力してください")
     end
     it 'last_name_kana（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name_kana = '田中' 
      @user.valid?
      expect(@user.errors.full_messages).to include("姓名（カナ）は不正な値です")
    end
     it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
     end
     it 'first_name_kana（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = '元' 
      @user.valid?
      expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
     end

     it "birthdayが空だと登録できない" do 
      @user.birthday = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
     end
    end
   end
 end
require 'rails_helper'

RSpec.describe RecordHome, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_home = FactoryBot.build(:record_home, user_id: user.id, item_id: item.id)
    end
  
      context '商品が購入できる場合' do
        it 'すべての情報が記入されていれば購入できる' do
          expect(@record_home).to be_valid
        end
        it 'bilding_nameは空でも購入できる' do
          @record_home.bilding_name = ''
          expect(@record_home).to be_valid
        end
      end
  
      context '商品が購入できない場合' do
        it 'itemが紐付いていないと購入できない' do
          @record_home.item_id = nil
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include("Itemを入力してください")
        end
        it 'userが紐付いていないと購入できない' do
          @record_home.user_id = nil
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include("Userを入力してください")
        end
        it "tokenが空では登録できない" do
          @record_home.token = nil
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include("クレジットカード情報を入力してください")
        end
        it '郵便番号が空欄なら購入できない' do
          @record_home.post_number = ''
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include("郵便番号を入力してください")
        end
        it '郵便番号にハイフンが記入していなければ購入できない' do
          @record_home.post_number = '1234567'
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include('郵便番号にハイフン(-)を入力してください')
        end
        it '郵便番号が全角数字だと購入できない' do
          @record_home.post_number = '０００-００００'
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include('郵便番号は不正な値です')
        end
        it '都道府県が空欄なら購入できない' do
          @record_home.area_id = 1
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include("都道府県を入力してください")
        end
        it '市区町村が空欄なら購入できない' do
          @record_home.city = ''
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include("市区町村を入力してください")
        end
        it '番地が空欄なら購入できない' do
          @record_home.house_number = ''
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include("番地を入力してください")
        end
        it '電話番号が空欄なら購入できない' do
          @record_home.phone_number = ''
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include("電話番号を入力してください")
        end
        it '電話番号にハイフンが記入していれば購入できない' do
          @record_home.phone_number = '000-00-0000'
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include("電話番号は不正な値です")
        end
        it '電話番号が全角数字だと購入できない' do
          @record_home.phone_number = '０８０１１１１２２２２'
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include("電話番号は不正な値です")
        end
        it '電話番号は9桁以下では購入できない' do
            @record_home.phone_number = '123456789'
            @record_home.valid?
            expect(@record_home.errors.full_messages).to include("電話番号は不正な値です")
        end
        it '電話番号は12桁以上では購入できない' do
          @record_home.phone_number = '123456789123'
          @record_home.valid?
          expect(@record_home.errors.full_messages).to include("電話番号は不正な値です")
        end
      end
  end
end

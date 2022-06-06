require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it 'すべての情報が記入されている' do
        expect(@item).to be_valid
      end
      it '料金は販売価格内である' do
        @item.price = '500'
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '商品画像を１枚つけていない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end     
      it '商品名が記入されていない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が記入されていない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーの情報が選択されていない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it '商品の状態の情報が選択されていない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '配送料の負担の情報が選択されていない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '発送元の地域の情報が選択されていない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it '発送までの日数の情報が選択されていない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it '価格が記入されていない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it '価格が半角数値ではない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it '価格が300円より小さい' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は299より大きい値にしてください")
      end
      it '価格が99,999,999円より大きい' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999より小さい値にしてください")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end      
    end

  end

end

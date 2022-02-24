require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'image,item_name,content,priceが存在し、item_quality,shipping_fee_burden,prefecture,days_to_shipのidが、それぞれ2以外であれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'contentが空では保存できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと保存できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be entered in half-width numbers')
      end
      it 'priceが300未満だと保存できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be entered between ¥300~¥9,999,999')
      end
      it 'priceが9999999より大きいと保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be entered between ¥300~¥9,999,999')
      end
      it 'category_idが1だと保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_quality_idが1だと保存できない' do
        @item.item_quality_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item quality can't be blank")
      end
      it 'shipping_fee_burden_idが1だと保存できない' do
        @item.shipping_fee_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
      end
      it 'prefecture_idが1だと保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_to_ship_idが1だと保存できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
    end
  end
end

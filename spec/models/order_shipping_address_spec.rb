require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
    sleep 0.2
  end
  
  describe '商品購入' do
    context '商品購入できる場合' do
      it "token,post_code,prefecture_id,municipalities,address,building,phone_numberが存在すれば保存できる" do
        expect(@order_shipping_address).to be_valid
      end
      it "buildingが空でも保存できる" do
        @order_shipping_address.building = ''
        expect(@order_shipping_address).to be_valid
      end
    end
    context '商品購入できない場合' do
      it "tokenが空では保存できない" do
        @order_shipping_address.token = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it "post_codeが空では保存できない" do
        @order_shipping_address.post_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeが全角では保存できない" do
        @order_shipping_address.post_code = '１２３−４５６７'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Post code must be entered in half-width character string (example:123-4567)')
      end
      it "post_codeにハイフンがなければ保存できない" do
        @order_shipping_address.post_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Post code must be entered in half-width character string (example:123-4567)')
      end
      it "prefecture_idが1では保存できない" do
        @order_shipping_address.prefecture_id = '1'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "municipalitiesが空では保存できない" do
        @order_shipping_address.municipalities = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "addressが空では保存できない" do
        @order_shipping_address.address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では保存できない" do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが全角では保存できない" do
        @order_shipping_address.phone_number = '０９０１２３４５６７８'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number must be entered in 10-11 half-width numbers (example:09012345678)')
      end
      it "phone_numberが10桁未満だと保存できない" do
        @order_shipping_address.phone_number = '09012345'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number must be entered in 10-11 half-width numbers (example:09012345678)')
      end
      it "phone_numberが12桁以上だと保存できない" do
        @order_shipping_address.phone_number = '090123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number must be entered in 10-11 half-width numbers (example:09012345678)')
      end
      it "userが紐づいていなければ保存できない" do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐づいていなければ保存できない" do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { Cart.new }

  describe "基本功能" do
    # before do
    #   @cart = Cart.new
    # end


    # def cart
    #   @cart ||= Cart.new
    # end


    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了。" do
      # cart = Cart.new # arrange
      cart.add_item(1) # act
      # expect(cart.empty?).to be false # assert

      expect(cart).not_to be_empty
    end

    it "如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變。" do
      # cart = Cart.new

      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }
      2.times { cart.add_item(1) }

      expect(cart.items.count).to be 2
      expect(cart.items[0].quantity).to be 5
    end

    it "商品可以放到購物車裡，也可以再拿出來。" do
      # cart = Cart.new

      i1 = create(:item)
      i2 = create(:item)

      3.times { cart.add_item(i1.id)}
      2.times { cart.add_item(i2.id)}

      expect(cart.items.first.item).to be_a Item
      expect(cart.items.first.item.price).to be i1.price
    end

    it "可以計算整台購物車的總消費金額。" do 
      # cart = Cart.new
      i1 = create(:item, price: 50)
      i2 = create(:item, price: 100)

      3.times { cart.add_item(i1.id)}
      2.times { cart.add_item(i2.id)}

      expect(cart.total).to be 350
    end

    it "特別活動可搭配折扣（例如聖誕節的時候全面打 9 折，或是滿額滿千送百或滿額免運費）。" do
      # cart = Cart.new
      i1 = create(:item, price: 50)
      i2 = create(:item, price: 100)

      3.times { cart.add_item(i1.id)}
      2.times { cart.add_item(i2.id)}

      t = Time.local(2008, 4, 1, 10, 5, 0)
      Timecop.travel(t)

      expect(cart.total).to eq 35
    end

  end

  describe "進階功能" do
    it "可以將購物車的內容轉成 Hash" do
      # cart = Cart.new
      i1 = create(:item)
      i2 = create(:item)

      3.times { cart.add_item(i1.id)}
      2.times { cart.add_item(i2.id)}

      expect(cart.to_hash).to eq cart_hash
    end

    it "還原購物車" do

      cart = Cart.from_hash(cart_hash)

      expect(cart.items.count).to be 2
    end
  end

  private
  def cart_hash
    {
        "items" => [
          {"item_id" => 1, "quantity" => 3},
          {"item_id" => 2, "quantity" => 2}
        ]
      }
  end

end

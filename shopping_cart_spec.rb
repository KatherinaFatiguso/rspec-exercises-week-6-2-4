# EXERCISE 6.2.5 PART 1
# Write a spec to describe a shopping cart class. It should:
#
# Define size (i.e. the number of items in the cart) attr_accessor
# Define a method to add a product to the cart
# Define a method to return the total value of the cart
# Define a method to return the total GST

# for shopping_cart.rb
require './shopping_cart'
require './product'
require 'rspec'
require 'rspec/its'

RSpec.describe ShoppingCart do
  let(:product1) { Product.new('Shoes', 160.00) }
  let(:product2) { Product.new('Skirt', 90.75)}
  let(:product3) { Product.new('Bag', 100.00)}

  subject(:cart) { ShoppingCart.new }
  its(:items)     { is_expected.to be_empty }

  describe "#cart_size" do
    subject { cart.cart_size }
    before do
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
    end
    it { is_expected.to eq(3) }
  end

  describe "#add_product" do
    subject { cart.add_product(product1) }

    context "Add a product." do
      it { is_expected.to include(product1) }
    end

    context "Add another product." do
      subject { cart.add_product(product2) }
      it { is_expected.to include(product2) }
    end
  end

  describe "#totalValue" do

    before do
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
    end

    subject { cart.total_value }
    it { is_expected.to eq(350.75) }
  end

  describe "remove(item)" do

    context 'a cart containing products' do
      before do
        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)
      end

      describe '#remove' do
        before { cart.remove(product3) }
        subject { cart.items }
        it { is_expected.to eq([product1, product2]) }
      end
    end

    context 'trying to remove an object from an empty cart' do

      describe '#remove' do
        subject { cart.remove(product1) }
        subject { cart.items }
        it { is_expected.to eq([]) } #back to empty array
      end
    end
  end

  describe "total_GST(products)" do

    context 'adding items with GST included' do
      before do
        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)
      end

      describe "#total_GST(products)" do
        subject { cart.total_GST([product1, product2, product3]) }
        it { is_expected.to eq(35.075) }
      end

      specify 'that total GST is correct' do #another way using specify
        expect(cart.total_GST([product1, product2, product3])).to eq(35.075)
      end
    end
  end

  describe 'the cart size changes when an item was removed or added' do
    specify 'that the cart size increases (when added)' do
      expect { cart.add_product(product1) }.to change { cart.cart_size }.by(1) #1 item added
    end

    before { cart.add_product(product1) }
    specify 'that the cart size decreases (when removed)' do
      expect { cart.remove(product1)}.to change { cart.cart_size }.by(-1) #1 item less
    end
  end

end #end of RSpec

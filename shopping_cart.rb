
require './product'
# EXERCISE 6.2. 5 PART 1
# Write a spec to describe a shopping cart class. It should:
#
# Define size (i.e. the number of items in the cart) attr_accessor
# Define a method to add a product to the cart
# Define a method to return the total value of the cart
# Define a method to return the total GST


class ShoppingCart
  attr_accessor :items, :value, :gst

  def initialize
    @items = []
  end

  def cart_size
    @items.size
  end

  def add_product(item)
    @items << item
  end

  def total_value
    sum = 0
    @items.each { |item| sum += item.price }
    sum
  end

  def remove(item)
    @items.delete(item)
  end

  def total_GST(products)
    sum = 0
    products.each { |product| sum += product.gst }
    sum
  end

end #end of class ShoppingCart

=begin
# for testing only
test = ShoppingCart.new
item = Product.new('Shoes', 160.00)
item2 = Product.new('Skirt', 90.75)

test.add_product(item)
test.add_product(item2)

puts test.total_value
=end

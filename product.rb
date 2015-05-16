# EXERCISE 6.2.4
# Implement the Product class as per this spec
# Add specs to describe a price_inc_gst method
# Implement price_inc_gst in your code

class Product
  attr_accessor :name, :price, :gst_exempt

  def initialize(name, price, gst_exempt = false) #if nothing is provided, it's false
    @name = name
    @price = price
    @gst_exempt = gst_exempt
  end

  def gst
    return 0.0 if @gst_exempt #its boolean, if it's true
    @price * 0.1
  end

  def price_inc_gst
    return @price if @gst_exempt
    @price * 1.1
  end

end #end of class Product

# testing purposes
# test = Product.new("bag", 25.75)
# puts test.gst

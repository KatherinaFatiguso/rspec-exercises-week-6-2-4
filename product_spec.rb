require './product'
require 'rspec'
require 'rspec/its'
# EXERCISE 6.2.4
# Implement the Product class as per this spec
# Add specs to describe a price_inc_gst method
# Implement price_inc_gst in your code


RSpec.describe Product do
  let(:price) { 100.0 }
  let(:gst_exempt) { true }
  let(:product) { Product.new("iPad", price, gst_exempt) }

  specify 'that name is set' do
    expect(product.name).to eq('iPad')
  end

  describe "#gst" do
    subject { product.gst }

    context "GST exempt" do
      let(:gst_exempt) { true }
      it { is_expected.to eq(0.0) }
    end

    context "GST not exempt" do
      let(:gst_exempt) { false }
      it { is_expected.to eq(price/10.0) }
    end
  end

  describe "#price_inc_gst" do
    subject {product.price_inc_gst}

    context "when GST is exempt" do
      it { is_expected.to eq (100.0) }
    end

    context "when GST is NOT exempt" do
      let(:gst_exempt) { false }
      it { is_expected.to eq(price * 1.1) }
    end
  end
end

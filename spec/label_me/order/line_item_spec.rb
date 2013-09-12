#coding:utf-8
require "spec_helper"

describe LabelMe::Order::LineItem do
  before do
    order      = LabelMe::SalesAll::Object.parse("spec/csv/sales_all.csv").first
    recipient  = order.recipients.first
    @line_item = recipient.line_items.first
  end

  describe "attributes" do
    describe "#number" do
      it "should return line item number" do
        expect(@line_item.number).to eq(45675678)
      end
    end

    describe "#quantity" do
      it "should return line item quantity" do
        expect(@line_item.quantity).to eq(2)
      end
    end

    describe "#unit_price" do
      it "should return line item unit price" do
        expect(@line_item.unit_price).to eq(893)
      end
    end

    describe "#code" do
      it "should return line item code" do
        expect(@line_item.code).to eq("56786789")
      end
    end
  end
end

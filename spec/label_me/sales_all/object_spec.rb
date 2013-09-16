#coding:utf-8
require "spec_helper"

describe LabelMe::SalesAll::Object do
  describe "class methods" do
    describe ".parse" do
      before do
        @orders = LabelMe::SalesAll::Object.parse("spec/csv/sales_all.csv")
      end

      it "should return Array of LabelMe::SalesAll::Row" do
        expect(@orders).to be_a_kind_of(Array)
        expect(@orders.size).to eq(4)
        expect(@orders.all?{|order| order.is_a? LabelMe::Order }).to be_true
      end
    end

    describe ".build" do
      before do
        @orders = LabelMe::SalesAll::Object.build("spec/csv/sales_all.csv")
      end

      it "should return tree structured instances of LabelMe::Order" do
        @orders.each{|order| puts order.to_hash}
        expect(@orders.size).to eq(2)
        expect(@orders[0].recipients.size).to eq(2)
        expect(@orders[0].recipients[0].line_items.size).to eq(2)
        expect(@orders[0].recipients[0].line_items.size).to eq(2)
        expect(@orders[0].recipients[1].line_items.size).to eq(1)
        expect(@orders[1].recipients.size).to eq(1)
        expect(@orders[1].recipients[0].line_items.size).to eq(1)
      end
    end
  end
end

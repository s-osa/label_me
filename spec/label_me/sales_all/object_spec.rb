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
  end
end

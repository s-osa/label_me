require "spec_helper"

describe LabelMe::SalesAll do
  describe ".parse" do
    before do
      @orders = LabelMe::SalesAll.parse("spec/csv/sales_all.csv")
    end

    it "should return Array of LabelMe::SalesAll::Row" do
      expect(@orders).to be_a_kind_of(Array)
      expect(@orders.size).to eq(1)
      expect(@orders.all?{|order| order.is_a? LabelMe::SalesAll::Row }).to be_true
    end
  end
end

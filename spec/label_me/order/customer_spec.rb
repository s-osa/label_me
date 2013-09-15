#coding:utf-8
require "spec_helper"

describe LabelMe::Order::Customer do
  before do
    order = LabelMe::SalesAll::Object.parse("spec/csv/sales_all.csv").first
    @customer = order.customer
  end

  describe "attributes" do
    describe "#number" do
      it "should return customer number" do
        expect(@customer.number).to eq(23453456)
      end
    end

    describe "#name" do
      it "should return customer name" do
        expect(@customer.name).to eq("桃瀬くるみ")
      end
    end

    describe "#email" do
      it "should return customer email" do
        expect(@customer.email).to eq("kurumi@example.com")
      end
    end

    describe "#phone_number" do
      it "should return customer phone number" do
        expect(@customer.phone_number).to eq("098-765-4321")
      end
    end

    describe "#address" do
      it "should return customer address" do
        expect(@customer.address).to match(/東京都大田区足柄.+402/)
      end
    end

    describe "#postal_code" do
      it "should return customer postal code" do
        expect(@customer.postal_code).to eq("1000001")
      end
    end
  end

  describe "#to_hash" do
    it "should return Hash" do
      hash = @customer.to_hash
      expect(hash[:number]).to eq(23453456)
      expect(hash[:name]).to eq("桃瀬くるみ")
      expect(hash[:email]).to eq("kurumi@example.com")
      expect(hash[:phone_number]).to eq("098-765-4321")
      expect(hash[:address]).to match(/東京都大田区足柄.+402/)
      expect(hash[:postal_code]).to eq("1000001")
    end
  end

  describe "#===" do
    before do
      @customer1 = LabelMe::SalesAll::Object.parse("spec/csv/sales_all.csv").first.customer
      @customer2 = LabelMe::SalesAll::Object.parse("spec/csv/sales_all.csv").first.customer
    end

    context "same attributes" do
      it "should return true" do
        expect(@customer1 === @customer2).to eq(true)
      end
    end

    context "different attributes" do
      it "should return false" do
        @customer2.number = 1
        expect(@customer1 === @customer2).to eq(false)
      end
    end
  end
end


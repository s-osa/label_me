#coding:utf-8
require "spec_helper"

describe LabelMe::SalesAll::Row do
  before do
    open("spec/csv/sales_all.csv", "r:windows-31j:utf-8") do |file|
      CSV.new(file, headers: true).each do |row|
        @row = LabelMe::SalesAll::Row.new(row)
        break
      end
    end
  end

  describe "general columns" do
    describe "#order_id" do
      it "should be return 売上ID" do
        expect(@row.order_id).to eq("12342345")
      end
    end

    describe "#order_date" do
      it "should be return 受注日" do
        expect(@row.order_date).to eq(Date.new(2013,1,18))
      end
    end

    describe "#customer_id" do
      it "should be return 購入者 顧客ID" do
        expect(@row.customer_id).to eq("23453456")
      end
    end

    describe "#customer_name" do
      it "should be return 購入者 名前" do
        expect(@row.customer_name).to eq("桃瀬くるみ")
      end
    end

    describe "#customer_postal_code" do
      it "should be return 購入者 郵便番号" do
        expect(@row.customer_postal_code).to eq("1000001")
      end
    end

    describe "#customer_address" do
      it "should be return 購入者 都道府県 and 購入者 住所" do
        expect(@row.customer_address).to match(/東京都大田区足柄.+402/)
      end
    end

    describe "#customer_email" do
      it "should be return 購入者 メールアドレス" do
        expect(@row.customer_email).to eq("kurumi@example.com")
      end
    end

    describe "#customer_phone_number" do
      it "should be return 購入者 電話番号" do
        expect(@row.customer_phone_number).to eq("098-765-4321")
      end
    end

    describe "#total_shipping_charge" do
      it "should be return 送料合計" do
        expect(@row.total_shipping_charge).to eq(600)
      end
    end

    describe "#total_message_card_charge" do
      it "should be return メッセージカード手数料合計" do
        expect(@row.total_message_card_charge).to eq(0)
      end
    end
  end
end

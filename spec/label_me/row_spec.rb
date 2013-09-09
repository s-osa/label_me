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
      it "should return 売上ID" do
        expect(@row.order_id).to eq("12342345")
      end
    end

    describe "#order_date" do
      it "should return 受注日" do
        expect(@row.order_date).to eq(Date.new(2013,1,18))
      end
    end
  end

  describe "customer columns" do
    describe "#customer_id" do
      it "should return 購入者 顧客ID" do
        expect(@row.customer_id).to eq("23453456")
      end
    end

    describe "#customer_name" do
      it "should return 購入者 名前" do
        expect(@row.customer_name).to eq("桃瀬くるみ")
      end
    end

    describe "#customer_postal_code" do
      it "should return 購入者 郵便番号" do
        expect(@row.customer_postal_code).to eq("1000001")
      end
    end

    describe "#customer_address" do
      it "should return 購入者 都道府県 and 購入者 住所" do
        expect(@row.customer_address).to match(/東京都大田区足柄.+402/)
      end
    end

    describe "#customer_email" do
      it "should return 購入者 メールアドレス" do
        expect(@row.customer_email).to eq("kurumi@example.com")
      end
    end

    describe "#customer_phone_number" do
      it "should return 購入者 電話番号" do
        expect(@row.customer_phone_number).to eq("098-765-4321")
      end
    end

    describe "#total_shipping_charge" do
      it "should return 送料合計" do
        expect(@row.total_shipping_charge).to eq(600)
      end
    end

    describe "#total_message_card_charge" do
      it "should return メッセージカード手数料合計" do
        expect(@row.total_message_card_charge).to eq(0)
      end
    end

    describe "#paid?" do
      it "should return 入金状態" do
        expect(@row.paid?).to eq(true)
      end
    end
  end

  describe "recipient columns" do
    describe "#recipient_id" do
      it "should return 配送先ID" do
        expect(@row.recipient_id).to eq("34564567")
      end
    end

    describe "#recipient_name" do
      it "should return 配送先 名前" do
        expect(@row.recipient_name).to eq("桃瀬修")
      end
    end

    describe "#recipient_kana" do
      it "should return 配送先 フリガナ" do
        expect(@row.recipient_kana).to eq("モモセシュウ")
      end
    end

    describe "#recipient_postal_code" do
      it "should return 配送先 郵便番号" do
        expect(@row.recipient_postal_code).to eq("1000001")
      end
    end

    describe "#recipient_address" do
      it "should return 配送先 都道府県名 and 配送先 住所" do
        expect(@row.recipient_address).to match(/東京都大田区足柄.+401/)
      end
    end

    describe "#recipient_phone_number" do
      it "should return 配送先 電話番号" do
        expect(@row.recipient_phone_number).to eq("0987-65-4321")
      end
    end

    describe "#wished_delivery_date" do
      it "should return 配送希望日" do
        expect(@row.wished_delivery_date).to eq("設定なし")
      end
    end

    describe "#wished_delivery_timezone" do
      it "should return 配送希望時間" do
        expect(@row.wished_delivery_timezone).to eq("14時-16時")
      end
    end

    describe "#recipient_labeling" do
      it "should return 配送先 熨斗（のし）" do
        expect(@row.recipient_labeling).to eq("のし")
      end
    end

    describe "#recipient_message_card_type" do
      it "should return 配送先 メッセージカード種類" do
        expect(@row.recipient_message_card_type).to eq("メッセージカードA")
      end
    end

    describe "#recipient_message_card_body" do
      it "should return 配送先 メッセージカード内容" do
        expect(@row.recipient_message_card_body).to eq("誕生日")
      end
    end

    describe "#recipient_notes" do
      it "should return 配送先 備考" do
        expect(@row.recipient_notes).to eq("備考欄です")
      end
    end
  end
end

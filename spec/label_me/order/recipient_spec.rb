#coding:utf-8
require "spec_helper"

describe LabelMe::Order::Recipient do
  before do
    order = LabelMe::SalesAll::Object.parse("spec/csv/sales_all.csv").first
    @recipient = order.recipients.first
  end

  describe "attributes" do
    describe "#number" do
      it "should return recipient number" do
        expect(@recipient.number).to eq(34564567)
      end
    end

    describe "#name" do
      it "should return recipient name" do
        expect(@recipient.name).to eq("桃瀬修")
      end
    end

    describe "#kana" do
      it "should return recipient kana" do
        expect(@recipient.kana).to eq("モモセシュウ")
      end
    end

    describe "#address" do
      it "should return recipient address" do
        expect(@recipient.address).to match(/東京都大田区足柄.+401/)
      end
    end

    describe "#pnohe_number" do
      it "should return recipient phone number" do
        expect(@recipient.phone_number).to eq("0987-65-4321")
      end
    end

    describe "#postal_code" do
      it "should return recipient postal code" do
        expect(@recipient.postal_code).to eq("1000001")
      end
    end

    describe "#labeling" do
      it "should return labeling" do
        expect(@recipient.labeling).to eq("のし")
      end
    end

    describe "#message_card" do
      it "should return message card" do
        expect(@recipient.message_card).to match(/メッセージカードA/)
        expect(@recipient.message_card).to match(/誕生日/)
      end
    end

    describe "#notes" do
      it "should return recipient notes" do
        expect(@recipient.notes).to match(/備考欄です/)
      end
    end

    describe "#wished_delivery_date" do
      it "should return recipient wished delivery date" do
        expect(@recipient.wished_delivery_date).to match(/設定なし/)
      end
    end

    describe "#wished_deivery_timezone" do
      it "should return recipient wished delivery timezone" do
        expect(@recipient.wished_delivery_timezone).to match(/14時\-16時/)
      end
    end

    describe "#recipients" do
      it "should return instances of LabelMe::Order::LineItem" do
        line_items = @recipient.line_items
        expect(line_items).to be_an_instance_of(Array)
        expect(line_items.size).to eq(1)
        expect(line_items.all?{|line_item| line_item.is_a? LabelMe::Order::LineItem }).to be_true
      end
    end
  end

  describe "#to_hash" do
    it "should return Hash" do
      hash = @recipient.to_hash
      expect(hash[:number]).to eq(34564567)
      expect(hash[:name]).to eq("桃瀬修")
      expect(hash[:kana]).to eq("モモセシュウ")
      expect(hash[:address]).to match(/東京都大田区足柄.+401/)
      expect(hash[:phone_number]).to eq("0987-65-4321")
      expect(hash[:postal_code]).to eq("1000001")
      expect(hash[:labeling]).to eq("のし")
      expect(hash[:message_card]).to match(/メッセージカードA/)
      expect(hash[:message_card]).to match(/誕生日/)
      expect(hash[:notes]).to match(/備考欄です/)
      expect(hash[:wished_delivery_date]).to match(/設定なし/)
      expect(hash[:wished_delivery_timezone]).to match(/14時\-16時/)
      expect(hash[:line_items_attributes]).to eq([@recipient.line_items.first.to_hash])
    end
  end
end



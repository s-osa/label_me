#coding:utf-8
module LabelMe
  module SalesAll
    class Row
      def initialize(row)
        @row = row
      end

      def order_id
        @row["売上ID"].to_s
      end

      def order_date
        Date.parse(@row["受注日"])
      end

      def customer_id
        @row["購入者 顧客ID"].to_s
      end

      def customer_name
        @row["購入者 名前"].to_s
      end

      def customer_postal_code
        @row["購入者 郵便番号"].to_s
      end

      def customer_address
        @row["購入者 都道府県"].to_s + @row["購入者 住所"].to_s
      end

      def customer_email
        @row["購入者 メールアドレス"].to_s
      end

      def customer_phone_number
        @row["購入者 電話番号"].to_s
      end

      def total_shipping_charge
        @row["送料合計"].to_i
      end

      def total_message_card_charge
        @row["メッセージカード手数料合計"].to_i
      end

      def paid?
        /入金済/ === @row["入金状態"]
      end
    end
  end
end

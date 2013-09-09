#coding:utf-8
module LabelMe
  module SalesAll
    class Row
      def initialize(row)
        @row = row
      end

      ############################################################
      # Accessors for general column
      ############################################################

      def order_id
        @row["売上ID"].to_s
      end

      def order_date
        Date.parse(@row["受注日"])
      end

      ############################################################
      # Accessors for customer column
      ############################################################

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

      ############################################################
      # Accessors for recipient column
      ############################################################

      def recipient_id
        @row["配送先ID"].to_s
      end

      def recipient_name
        @row["配送先 名前"].to_s
      end

      def recipient_kana
        @row["配送先 フリガナ"].to_s
      end

      def recipient_postal_code
        @row["配送先 郵便番号"].to_s
      end

      def recipient_address
        @row["配送先 都道府県名"].to_s + @row["配送先 住所"].to_s
      end

      def recipient_phone_number
        @row["配送先 電話番号"].to_s
      end

      def wished_delivery_date
        @row["配送希望日"].to_s
      end

      def wished_delivery_timezone
        @row["配送希望時間"].to_s
      end

      def recipient_labeling
        @row["配送先 熨斗（のし）"].to_s
      end

      def recipient_message_card_type
        @row["配送先 メッセージカード種類"].to_s
      end

      def recipient_message_card_body
        @row["配送先 メッセージカード内容"].to_s
      end

      def recipient_notes
        @row["配送先 備考"].to_s
      end

      ############################################################
      # Accessors for line item column
      ############################################################

      def line_item_id
        @row["売上詳細ID"].to_s
      end

      def line_item_code
        @row["購入商品 商品ID"].to_s
      end

      def line_item_unit_price
        @row["購入商品 販売価格(消費税込)"].to_i
      end

      def line_item_quantity
        @row["購入商品 販売個数"].to_i
      end
    end
  end
end

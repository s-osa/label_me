module LabelMe
  class Order
    class Recipient
      require "label_me/order/line_item"

      def initialize(row)
        @number       = row.recipient_id.to_i
        @name         = row.recipient_name
        @kana         = row.recipient_kana
        @address      = row.recipient_address
        @phone_number = row.recipient_phone_number
        @postal_code  = row.recipient_postal_code
        @labeling     = row.recipient_labeling
        @message_card = row.recipient_message_card_type.to_s +  " " + row.recipient_message_card_body.to_s
        @notes        = row.recipient_notes
        @wished_delivery_date     = row.wished_delivery_date
        @wished_delivery_timezone = row.wished_delivery_timezone
        @line_items   = [LabelMe::Order::LineItem.new(row)]
      end

      attr_accessor :number
      attr_accessor :name
      attr_accessor :kana
      attr_accessor :address
      attr_accessor :phone_number
      attr_accessor :postal_code
      attr_accessor :labeling
      attr_accessor :message_card
      attr_accessor :notes
      attr_accessor :wished_delivery_date
      attr_accessor :wished_delivery_timezone
      attr_accessor :line_items

      def to_hash
        {
          number:       number,
          name:         name,
          kana:         kana,
          address:      address,
          phone_number: phone_number,
          postal_code:  postal_code,
          labeling:     labeling,
          message_card: message_card,
          notes:        notes,
          wished_delivery_date:     wished_delivery_date,
          wished_delivery_timezone: wished_delivery_timezone,
          line_items_attributes: line_items.map(&:to_hash)
        }
      end

      def ===(other)
        self.number == other.number
      end
    end
  end
end


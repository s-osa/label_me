module LabelMe
  class Order
    class LineItem
      def initialize(row)
        @number     = row.line_item_id.to_i
        @quantity   = row.line_item_quantity.to_i
        @unit_price = row.line_item_unit_price.to_i
        @code       = row.line_item_code
      end

      attr_accessor :number
      attr_accessor :quantity
      attr_accessor :unit_price
      attr_accessor :code

      def to_hash
        {
          number:     number,
          quantity:   quantity,
          unit_price: unit_price,
          code:       code
        }
      end
    end
  end
end


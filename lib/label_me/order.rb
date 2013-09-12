module LabelMe
  class Order
    require "label_me/order/customer"
    require "label_me/order/recipient"

    def initialize(row)
      @number              = row.order_id.to_i
      @order_date          = row.order_date
      @paid                = row.paid?
      @shipping_charge     = row.total_shipping_charge
      @message_card_charge = row.total_message_card_charge
      @customer            = LabelMe::Order::Customer.new(row)
      @recipients          = [LabelMe::Order::Recipient.new(row)]
    end

    attr_accessor :number
    attr_accessor :order_date
    attr_accessor :shipping_charge
    attr_accessor :message_card_charge
    attr_accessor :customer
    attr_accessor :recipients

    def paid?
      @paid
    end

    def to_hash
      {
        number:                number,
        order_date:            order_date,
        paid?:                 paid?,
        shipping_charge:       shipping_charge,
        message_card_charge:   message_card_charge,
        customer_attributes:   customer.to_hash,
        recipients_attributes: recipients.map(&:to_hash),
      }
    end
  end
end


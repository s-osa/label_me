module LabelMe
  class Order
    class Customer
      def initialize(row)
        @number       = row.customer_id.to_i
        @name         = row.customer_name
        @email        = row.customer_email
        @phone_number = row.customer_phone_number
        @address      = row.customer_address
        @postal_code  = row.customer_postal_code
      end

      attr_accessor :number
      attr_accessor :name
      attr_accessor :email
      attr_accessor :phone_number
      attr_accessor :address
      attr_accessor :postal_code

      def to_hash
        {
          number:       number,
          name:         name,
          email:        email,
          phone_number: phone_number,
          address:      address,
          postal_code:  postal_code
        }
      end
    end
  end
end

#coding:utf-8
module LabelMe
  module SalesAll
    class Object
      require "label_me/sales_all/row"

      class << self
        def parse(csv_path)
          LabelMe::SalesAll::Row.parse(csv_path).map{|order_row| LabelMe::Order.new(order_row) }
        end
      end
    end
  end
end

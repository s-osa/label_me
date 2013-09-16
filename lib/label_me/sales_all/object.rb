#coding:utf-8
module LabelMe
  module SalesAll
    class Object
      require "label_me/sales_all/row"
      require "grafter"

      class << self
        def parse(csv_path)
          LabelMe::SalesAll::Row.parse(csv_path).map{|order_row| LabelMe::Order.new(order_row) }
        end

        def build(csv_path)
          parse(csv_path).graft(operator: :===, branch: :recipients) do |recipients|
            recipients.graft(operator: :===, branch: :line_items)
          end
        end
      end
    end
  end
end

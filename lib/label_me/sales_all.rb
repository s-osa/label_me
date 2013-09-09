module LabelMe
  module SalesAll
    require "label_me/sales_all/row"
    require 'csv'

    def parse(csv_path)
      rows = []
      open(csv_path, "r:windows-31j:utf-8") do |file|
        CSV.new(file, headers: true).each do |row|
          rows << LabelMe::SalesAll::Row.new(row)
        end
      end
      rows
    end

    module_function :parse
  end
end

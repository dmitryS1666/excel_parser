require 'roo'
require_relative '../models/product'

class Parser
  def read_xls(path)
    Roo::Spreadsheet.open(path, extension: :xlsx)
  end

  def parse_xls(file)
    file.parse(
      part_name: /Запчасть|Название запчасти/,
      car_vendor: /Марка/,
      car_model: /Модель/,
      price: /Цена|цена|Стоимость/,
      in_stock: /В наличии/,
      part_vendor: /Производитель/,
      part_number: /ОЕМ|Номер производителя/
    )
  end

  def array_to_product(arr)
    result = []

    arr.each do |el|
      result << hash_to_product(el)
    end

    result
  end

  def first_n_el(array, num)
    array.first(num)
  end

  def last_n_el(array, num)
    array.last(num)
  end

  def hash_to_product(hash)
    product = Product.new(hash[:part_name], hash[:car_vendor], hash[:car_model], hash[:price], hash[:in_stock],
                hash[:part_vendor], hash[:part_number]
    )
    product.to_json
  end

end
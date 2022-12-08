require 'json'

class Product
  attr_accessor :part_name, :car_vendor,
                :car_model, :price, :in_stock,
                :part_vendor, :part_number

  def initialize(part_name, car_vendor, car_model, price, in_stock,
                 part_vendor = '', part_number = '')
    @part_name = part_name
    @car_vendor = car_vendor
    @car_model = car_model
    @price = price
    @in_stock = in_stock
    @part_vendor = part_vendor
    @part_number = part_number
  end

  def as_json(options = {})
    {
      part_name: @part_name,
      car_vendor: @car_vendor,
      car_model: @car_model,
      price: @price,
      in_stock: @in_stock,
      part_vendor: @part_vendor,
      part_number: @part_number
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
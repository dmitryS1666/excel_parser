require_relative '../lib/parser'

class Main
  Dir["resources/*"].each do |path|
    parser = Parser.new
    puts path

    xlsx = parser.read_xls(path)
    array_hash = parser.parse_xls(xlsx)
    json_objs = parser.array_to_product(array_hash)

    puts "FIRST 3 elements"
    puts parser.first_n_el(json_objs, 3)
    puts "LAST 3 elements"
    puts parser.last_n_el(json_objs, 3)
  end
end

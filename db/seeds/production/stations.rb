require "csv"

CSV.foreach('db/csv/station20141030free.csv') do |row|
  Station.create(:id => row[0], :route_id => row[5], :name => row[2], :prefecture_id => row[6])
end
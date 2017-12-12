require "csv"

CSV.foreach('db/csv/line20141030free.csv') do |row|
  Route.create(:id => row[0], :name => row[2])
end
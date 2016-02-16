require 'csv'

Employee.delete_all

CSV.foreach("#{Rails.root}/db/Employee_Earnings_Report_2014.csv",
  { headers: true , header_converters: :symbol }) do |row|
  Employee.create name: row[:name], title: row[:title],
                  salary: row[:regular][1..-1].to_f
end

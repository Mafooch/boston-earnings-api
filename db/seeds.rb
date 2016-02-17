require 'csv'

Employee.delete_all

ActiveRecord::Base.transaction do
# mass inserts faster in a transaction

  CSV.foreach("#{Rails.root}/db/Employee_Earnings_Report_2014.csv",
  { headers: true , header_converters: :symbol }) do |row|
    Employee.create! name: row[:name], title: row[:title],
    salary: row[:regular][1..-1]
  end
end

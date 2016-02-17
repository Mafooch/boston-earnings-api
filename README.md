== README

This is a simple API that utilizes 2014 Boston employee earnings data to return average salary by the job title specified in the HTTP request params.

The API was made using a rails generator which draws in folders and boiler code automatically. You can find the code I wrote myself in the following locations:
app/controllers/salaries_controller.rb
app/models/employee.rb
app/models/salary.rb
Everything within the db folder
spec/requests/get_average_salary_spec.rb
spec/spec_helper.rb (the json_body helper method)

Many of the design decisions made in the construction of this API stem from a trade-off between developing for now or the future. This trade-off became evident from the start when I needed to consider just how many of the data fields from the employee earnings should be included. Some of those fields might not be important for the purpose of the API at the moment but could be useful further along.


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

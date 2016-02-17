== README

SUMMARY

This is a simple API that utilizes 2014 Boston employee earnings data to return average salary by the job title specified in the HTTP request params.

The API was made using a rails generator which draws in folders and boiler code automatically. You can find the code I wrote myself in the following locations:
app/controllers/salaries_controller.rb
app/models/employee.rb
app/models/salary.rb
Everything within the db folder
spec/requests/get_average_salary_spec.rb
spec/spec_helper.rb (the json_body helper method)

REASONING

Many of the design decisions made in the construction of this API stem from a trade-off between developing for now or the future. This trade-off became evident from the start when I needed to consider just how many of the fields from the employee earnings should be included. Some of those fields might not be important for the purpose of the API at the moment but could be useful further along. Furthermore, at some point, depending on the number of calls being issued, it might make sense to have a table just for average salaries by title which could be recalculated regularly based on the larger employee table. Another difficulty arose in how to partition out the code to be as RESTful as possible. Since I elected the use of only one table/ActiveRecord model (employees), did it make sense to have a separate controller and model just for salaries? As you can see from my code, I think it does. For the purpose of this API and in keeping with RESTful principles, I believe salary should be considered it's own resource, even if it's not persisted. This allowed me to write clear, encapsulated, object oriented code that aligns more closely with the single responsibility principle. I wrote the controller and model based off salary, not average_salary, as I can well envision future, non-average salary calls being made such as max salary, min salary, mean salary, etc..

The title search, which exists as a scope in the Salary model, should eventually be made far more robust probably with the use of regex, but this warrants much more consideration regarding the API's purpose.

USAGE

To take a look at the application in development, first populate the development db by typing rake db:seed from the command line. This may take a minute or so. You can then try it out from your browser like so "http://localhost:3000/average_salary?title=nurse".
Alternatively, you can simulate the same request from your command line by enter curl http://localhost:3000/average_salary?title=nurse

You can run the API request tests by simply navigating to the root folder from the command line and entering 'rspec'

MORE

Unfortunately, the code I'm most proud of was written for clients and cannot legally be shared. I am, however, currently working on a lengthy assignment that's part of a four week course on the MongoDB Ruby driver through Jon Hopkins University that I'm excited about. The assignment utilizes aggregation queries, geolocation (using a 2dspehere index), GridFS storage and retrieval, and document linking. Another part of the assignment that has been especially instructive is the requirement to code your own middleware ORM (similar to ActiveRecord) instead of using Mongoid, which will be covered in the upcoming weeks.
The code which is still very much a work in progress can be found here: github.com/Mafooch/pic-place.
LinkedIn profile: www.linkedin.com/in/joshuamaffuccio

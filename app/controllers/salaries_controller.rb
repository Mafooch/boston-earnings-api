class SalariesController < ApplicationController
# NOTE: merits it's own controller. can see this as a resource all of it's own
# in the future

  def average_salary
    employees = Employee.has_title params[:title]
    average_salary = Salary.new Salary.average(employees)
    formatted_salary = average_salary.formatted

    average_salary_hash = { "average_salary" => formatted_salary }
    render json: average_salary_hash, status: 200
  end
end

class SalariesController < ApplicationController
# NOTE: merits it's own controller. Salary should be treated as a resource of
# its own especially as more and more salary related api calls are added

  def average_salary
    employees = params[:title] ? Employee.has_title(params[:title]) : Employee.all
    params[:title] ||= "all"

    average_salary = Salary.new(Salary.average(employees), params[:title])

    if average_salary.amount.present?
      render json: average_salary, status: 200
    else
      render json: { error: "No matching titles found" }, status: 404
    end
  end
end

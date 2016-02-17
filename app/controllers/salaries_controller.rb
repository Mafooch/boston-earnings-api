class SalariesController < ApplicationController
# NOTE: merits it's own controller. Salary should be treated as a resource of
# its own especially as more and more salary related api calls are added

  def average_salary
    employees = params[:title] ? Employee.has_title(params[:title]) : Employee.all

    average_salary = Salary.new Salary.average(employees)
    formatted_salary = average_salary.formatted

    average_salary_hash = { "average_salary" => formatted_salary }
    # binding.pry
    if average_salary_hash["average_salary"]
      render json: average_salary_hash, status: 200
    else
      render json: { error: "No matching titles found" }, status: 404
    end
  end
end

Rails.application.routes.draw do
  get "/average_salary", to: "salaries#average_salary"
end

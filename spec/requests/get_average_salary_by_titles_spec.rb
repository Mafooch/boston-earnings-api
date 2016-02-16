require 'rails_helper'

RSpec.describe "Salaries API", type: :request do
  describe "GET /average_salary" do
    context "when supplied a title parameter" do
      nurse_1 = Employee.create(name: "Jane Doe", title: "nurse", salary: 53000.87)
      nurse_2 = Employee.create(name: "Jane Doe", title: "nurse", salary: 52650.09)
      average = 52825.48
      it "returns the average salary by that title" do
        get "/average_salary?title=nurse"
        json = JSON.parse response.body
        # TODO create a module method for this

        expect(json["average_salary"]).to eq average
        # expect(JSON.parse(response.body)).to true
      end
    end
  end
end

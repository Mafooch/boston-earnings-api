require 'rails_helper'

RSpec.describe "Salaries API", type: :request do
  describe "GET /average_salary" do
    before :each do
      Employee.create!([
        { name: "Who", title: "doctor", salary: 94000.87 },
        { name: "Dolittle", title: "doctor", salary: 114045.09 },
        { name: "Frizzle", title: "Teacher", salary: 46790.09 },
        { name: "Edna Krabbapel", title: "Teacher I", salary: 50933.09 },
        { name: "John Keating ", title: "Substitute Teacher", salary: 57909.09 },
        ])
      end

    context "when supplied a title parameter" do

      it "returns the average salary by title" do
        average = "$104,022.98"

        get "/average_salary?title=doctor"
        json = JSON.parse response.body
        # TODO create a module method for this

        expect(Mime::JSON).to eq response.content_type
        expect(response).to have_http_status 200
        expect(json["average_salary"]).to eq average
      end

      it "returns average salary by all partially matching titles" do
        average = "$51,877.42"

        get "/average_salary?title=teacher"
        json = JSON.parse response.body

        expect(Mime::JSON).to eq response.content_type
        expect(response).to have_http_status 200
        expect(json["average_salary"]).to eq average
      end
    end

    context "when not supplied a title parameter" do
      it "returns the average salary for all employees" do
        get "/average_salary"
        json = JSON.parse response.body
        average = "$72,735.65"
        expect(Mime::JSON).to eq response.content_type
        expect(response).to have_http_status 200
        expect(json["average_salary"]).to eq average
      end
    end

    context "when given a title with no matches" do
      it "returns an error code and message" do
        get "/average_salary?title=nonexistenttitle"
        json = JSON.parse response.body
        expect(Mime::JSON).to eq response.content_type
        expect(response).to have_http_status 404
        expect(json["error"]).to eq "No matching titles found"
      end
    end
  end
end

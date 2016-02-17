class Salary
# NOTE just a PORO. Not persisting salary model for now, but
# can envision many salary related methods to come with too much
# business logic for a controller
attr_reader :amount, :title

  def initialize amount, title
    @amount = Salary.formatted_salary amount
    @title = title
  end

  def self.formatted_salary salary
    ActionController::Base.helpers.number_to_currency salary
    # a method already available with rails, typically used in views
  end

  def self.average employee_records
    employee_records.average :salary
  end
end

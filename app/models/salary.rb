class Salary
# NOTE just a PORO. Not persisting salary model for now, but
# can envision many salary related methods to come with too much
# business logic for a controller

  def initialize amount
    @amount = amount
  end

  def formatted
    ActionController::Base.helpers.number_to_currency @amount
    # a method already available with rails, typically used in views
  end

  def self.average employee_records
    employee_records.average :salary
  end
end

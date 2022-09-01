class Admin < ApplicationRecord
  belongs_to :employee

  attr_reader :employee, :is_admin

  def initialize(employee)
    @employee = employee
  end

  def self.create?(employee)
    new(employee).create?
  end

  def create?
    with_tags? && author_is_allowed?
  end

  private

  def author_is_allowed?
    is_admin?
  end

  def is_admin?
    employee.is_admin == true
  end
end

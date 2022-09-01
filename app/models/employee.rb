class Employee < ApplicationRecord

  has_many :admins


	validates :name, presence: true
  validates :employee_detail, presence: true
  validates :date, presence: true
  validates :is_admin, presence: true
end
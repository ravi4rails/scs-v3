class Department < ActiveRecord::Base
  has_many :courses
  has_many :employees
  has_many :students
  validates :name, :presence => true, :uniqueness => true
end

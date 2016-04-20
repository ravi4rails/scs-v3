class Subject < ActiveRecord::Base
  has_many :semester_subjects
  has_many :semesters, through: :semester_subjects
  validates :name, :presence => true
end

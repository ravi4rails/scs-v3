class Student < ActiveRecord::Base
  validates :first_name, :last_name, :middle_name, :date_of_birth, :admission_date, :enrollment_date, :presence => true
  validates :admission_number, :enrollment_number, :email, :presence => true, :uniqueness => true

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

end

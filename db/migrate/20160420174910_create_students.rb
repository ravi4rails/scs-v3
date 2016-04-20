class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.integer :age
      t.string :contact
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :course_id
      t.string :email
      t.string :enrollment_number
      t.string :admission_number
      t.date :admission_date
      t.date :enrollment_date
      t.string :blood_group
      t.string :relegion
      t.string :category

      t.timestamps null: false
    end
  end
end

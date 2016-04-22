class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.date :date_of_joining
      t.string :qualification
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :contact
      t.string :email
      t.integer :department_id

      t.timestamps null: false
    end
  end
end

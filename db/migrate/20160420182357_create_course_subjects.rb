class CreateCourseSubjects < ActiveRecord::Migration
  def change
    create_table :course_subjects do |t|
      t.references :course, index: true, foreign_key: true
      t.string :subject_references

      t.timestamps null: false
    end
  end
end

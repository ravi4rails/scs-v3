class ReomveSubjectReferencesFromCourseSubjects < ActiveRecord::Migration
  def change
    remove_column :course_subjects, :subject_references, :string
    add_column :course_subjects, :subject_id, :integer
  end
end

module ApplicationHelper
  def subject_of_course(course)
    Subject.all - course.subjects
  end
end

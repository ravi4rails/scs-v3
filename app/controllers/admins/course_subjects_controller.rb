class Admins::CourseSubjectsController < ApplicationController
  layout 'admin'
  def destroy
    @course_subject = CourseSubject.find(params[:id])
    @course_subject.destroy
    respond_to do |format|
      format.js
    end
  end
end

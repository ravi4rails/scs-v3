class Admins::CoursesController < ApplicationController
  layout 'admin'
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.js
        format.html { redirect_to admins_course_path(@course), notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.js
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.js
        format.html { redirect_to admins_course_path(@course), notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.js
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to admins_courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def include_subjects
    @course = Course.find(params[:include_subjects][:course_id])
    params[:include_subjects][:subject].delete("")
    subject_array = params[:include_subjects][:subject]
    subject_array.each do |subject|
      CourseSubject.create(:course_id => @course.id, :subject_id => subject.to_i)
    end
  end

  def remove_course_subject
    @course_subject = CourseSubject.find(params[:course_subject_id])
    @course_subject.destroy
    redirect_to admins_courses_path
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :department_id)
    end
end

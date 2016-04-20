class Admins::StudentsController < ApplicationController
  layout 'admin'
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to admins_student_path(@student), notice: 'Student was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: admins_student_path(@student) }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to admins_student_path(@student), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: admins_student_path(@student) }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to admins_students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :middle_name, :last_name, :date_of_birth, :age, :contact, :address, :city, :state, :country, :course_id, :email, :enrollment_number, :admission_number, :admission_date, :enrollment_date, :blood_group, :relegion, :category)
    end
end

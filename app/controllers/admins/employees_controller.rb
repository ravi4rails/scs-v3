class Admins::EmployeesController < ApplicationController

  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to admins_employee_path(@employee), notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: admins_employee_path(@employee) }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to admins_employee_path(@employee), notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: admins_employee_path(@employee) }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to admins_employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :middle_name, :last_name, :date_of_birth, :date_of_joining, :qualification, :address, :city, :state, :country, :contact, :email, :department_id)
    end
end

class EmployeesController < ApplicationController

  before_action :set_employee, only: [:edit, :update, :destroy]
  before_action :authorized?, only: [:edit, :update, :destroy]

  
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee
    else
      render :new, status: :unprocessable_entity
    end
  end

  def allowed?
    admin?
  end

  def admin?
    @employee.where(is_admin: true)
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :employee_detail, :date, :is_admin)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def authorized?
    unless @employee.is_admin == true
      render :file => "public/404.html", :status => :unauthorized
    end
  end

end

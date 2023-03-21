class EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @employees = Employee.all 
  end

  def new 
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)  
    SendMailer.send_email(@employee.email, employee).deliver_now

  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.present?
      @employee.update(employee_params)
      render json: EmployeeSerializer.new(@employee).serializable_hash, status: :ok
    else
      render json: {message: "is not found"}
    end
  end

  def show
    @employee = Employee.find(params[:id])
    render json: (@employee), status: :ok
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.destroy
      render json: (@employee), status: :ok
    else 
      render json:{message: 'successfuly delete'}
    end
  end
  private
  def employee_params
    params.require(:employee).permit(:name, :age, :city, :state, :address, :email)
  end
end

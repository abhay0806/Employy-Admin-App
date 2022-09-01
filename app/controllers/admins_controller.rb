class AdminsController < ApplicationController

  def create
    @employee = Employee.find(params[:employee_id])
    redirect_to employee_path(@employee)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

class DepartmentsController < ApplicationController
  def index
  	@departments = Department.paginate page: params[:page], per_page: 5
  end

  def show
  	@department = Department.find params[:id]
  end

  private

    def department_params
      	params.require(:department).permit :name
    end

end
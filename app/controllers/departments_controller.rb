class DepartmentsController < ApplicationController
  def index
  	@departments = Department.paginate(page: params[:page])
  end

  def new
  	@department = Department.new
  end

  def show
  	@department = Department.find(params[:id])
  end

  def create
  	@department = Department.new(department_params)
  	if @department.save
  		flash[:success] = "Create successfuly"
  		redirect_to @department
  	else
  		render 'new'
  	end
  end

  def edit
  	@department = Department.find(params[:id])
  end

  def update
  	@department = Department.find(params[:id])
  	if @department.update_attributes(department_params)
  		flash[:success] = "Department updated"
  		redirect_to @department
  	else
  		render 'edit'
  	end	
  end

  def destroy
  	Department.find(params[:id]).destroy
  	flash[:success] = "Department deleted"
  	redirect_to departments_url
  end

  private

    def department_params
      	params.require(:department).permit(:name)
    end

end
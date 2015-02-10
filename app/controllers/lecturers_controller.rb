class LecturersController < ApplicationController
  def show
  	@lecturer = Lecturer.find params[:id]
  end

  def index 
  	@lecturers = Lecturer.paginate(page: params[:page])
  end

  def new
  	@lecturer = Lecturer.new
  end

  def create
    @lecturer = Lecturer.new(lecturer_params)
    if @lecturer.save
      log_in @lecturer
      flash[:success] = "Created!"
      redirect_to lecturers_path
    else
      render 'new'
    end
  end

  def edit 
  	@lecturer = Lecturer.find params[:id]
  end

  def update
    @lecturer = Lecturer.find params[:id]
    if @lecturer.update_attributes(lecturer_params)
      flash[:success] = "Account updated"
      redirect_to lecturers_path
    else
      render 'edit'
    end
  end

  def destroy
    Lecturer.find(params[:id]).destroy
    flash[:success] = "Account deleted"
    redirect_to lecturers_url
  end

  private

    def lecturer_params
      	params.require(:lecturer).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

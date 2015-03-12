class Admin::LecturersController < AdminController
  def show
    @lecturer = Lecturer.find params[:id]
  end

  def index 
    @lecturers = Lecturer.paginate page: params[:page], per_page: 10
  end

  def new
    @lecturer = Lecturer.new
  end

  def create
    @lecturer = Lecturer.new(lecturer_params)
    if @lecturer.save
      flash[:success] = "New lecturer created!"
      redirect_to admin_lecturers_path
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
      flash[:success] = "This lecturer updated"
      redirect_to admin_lecturers_path
    else
      render 'edit'
    end
  end

  def destroy
    Lecturer.find(params[:id]).destroy
    flash[:success] = "Lecturer deleted!"
    redirect_to admin_lecturers_path
  end

  private
  def lecturer_params
    params.require(:lecturer).permit :name, :email, :password,
                                   :password_confirmation
  end
end
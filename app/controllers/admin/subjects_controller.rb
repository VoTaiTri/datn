class Admin::SubjectsController < ApplicationController
  def index
    @subjects = Subject.paginate page: params[:page], per_page: 10
  end

  def show
  end

  def destroy
    Subject.find(params[:id]).destroy
    flash[:success] = "Subject delete!"
    redirect_to admin_subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit :name, :department_id
  end
end

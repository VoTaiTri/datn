class SubjectsController < ApplicationController
  before_action :logged_in_user

  def index
    @subjects = current_lecturer.subjects.paginate page: params[:page], per_page: 5
  end

  def destroy
    subject = current_lecturer.subjects.find params[:id]
    if subject
      current_lecturer.subjects.destroy(subject)
      flash[:success] = "Subject deleted"
      redirect_to subjects_path
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name, :department_id
  end
end
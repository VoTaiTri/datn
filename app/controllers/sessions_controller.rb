class SessionsController < ApplicationController
  def new
  end

  def create
    lecturer = Lecturer.find_by(email: params[:session][:email.downcase])
    if lecturer && lecturer.authenticate(params[:session][:password])
      log_in(lecturer)
      params[:session][:remember_me] == '1' ? remember(lecturer) : forget(lecturer)
      redirect_to lecturer
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

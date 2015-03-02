module SessionsHelper
  def log_in(lecturer)
    session[:lecturer_id] = lecturer.id
  end

  def remember(lecturer)
    lecturer.remember
    cookies.permanent.signed[:lecturer_id] = lecturer.id
    cookies.permanent[:remember_token] = lecturer.remember_token
  end

  # Forgets a persistent session.
  def forget(lecturer)
    lecturer.forget
    cookies.delete :lecturer_id
    cookies.delete :remember_token
  end

  def current_lecturer
    if (lecturer_id = session[:lecturer_id])
      @current_lecturer ||= Lecturer.find_by id: lecturer_id
    elsif (lecturer_id = cookies.signed[:lecturer_id]) 
      lecturer = Lecturer.find_by id: lecturer_id
      if lecturer && lecturer.authenticated?(cookies[:remember_token])
        log_in lecturer
        @current_lecturer = lecturer
      end
    end
  end

  def logged_in?
    !current_lecturer.nil?
  end

  def logged_in_admin?
    !current_lecturer.nil? && current_lecturer.admin?
  end

  def logged_in_lecturer?
    !current_lecturer.nil? && !current_lecturer.admin?
  end

  def log_out
    session.delete :lecturer_id
    current_lecturer = nil
  end

  # Logs out the current lecturer.
  def log_out
    forget(current_lecturer)
    session.delete(:lecturer_id)
    @current_lecturer = nil
  end

end
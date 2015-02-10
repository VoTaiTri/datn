module SessionsHelper
  # Logs in the given user.
  def log_in(lecturer)
    session[:lecturer_id] = lecturer_id
  end

  # Returns the current logged-in user (if any).
  def current_lecturer
    @current_lecturer ||= Lecturer.find_by(id: session[:lecturer_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_lecturer.nil?
  end
end

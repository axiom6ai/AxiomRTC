class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  include AdminSessionsHelper
  include StudentSessionsHelper
  include TeacherSessionsHelper
  include ApplicationHelper

  def logged_in_admin
    return if current_admin
    redirect_to admin_login_path
  end

  def logged_in_teacher
    return if current_teacher
    redirect_to teacher_login_path
  end

  def logged_in_student
    return if current_student
    redirect_to student_login_path
  end

  def logged_in
    return if current_admin || current_teacher || current_student
    redirect_to student_login_path
  end

  def logged_in_user
    return if current_teacher || current_student
    redirect_to student_login_path
  end

end

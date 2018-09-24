module TeacherSessionsHelper

  def login_teacher(teacher)
    session[:teacher] = teacher.id
    @current_teacher = teacher
  end

  def logout_teacher
    session.delete :teacher
    @current_teacher = nil
  end

  def current_teacher
    return @current_teacher if @current_teacher
    id = session[:teacher]
    return nil unless id
    @current_teacher = Teacher.find_by_id id
  end

end

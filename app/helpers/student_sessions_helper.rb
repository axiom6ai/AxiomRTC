module StudentSessionsHelper

  def login_student(student)
    session[:student] = student.id
    @current_student = student
  end

  def logout_student
    session.delete :student
    @current_student = nil
  end

  def current_student
    return @current_student if @current_student
    id = session[:student]
    return nil unless id
    @current_student = Student.find_by_id id
  end

end

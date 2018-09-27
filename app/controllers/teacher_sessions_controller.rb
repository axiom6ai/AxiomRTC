class TeacherSessionsController < ApplicationController

  before_action :prevent_duplicated, except: [:destroy]

  def new
  end

  def create
    teacher = Teacher.find_by_mobile params[:session][:mobile]
    unless teacher && teacher.authenticate(params[:session][:password])
      flash.now[:alert] = t 'sessions.invalid_combination'
      render 'new' and return
    end

    login_teacher teacher
    logout_admin
    logout_student
    redirect_to teacher
  end

  def destroy
    logout_teacher
    redirect_to new_teacher_sessions_path
  end

  def prevent_duplicated
    redirect_to current_teacher if current_teacher
  end

end

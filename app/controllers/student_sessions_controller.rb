class StudentSessionsController < ApplicationController

  before_action :prevent_duplicated, except: [:destroy]

  def new
  end

  def create
    student = Student.find_by_id params[:session][:id]
    unless student && student.authenticate(params[:session][:password])
      flash.now[:alert] = t 'sessions.invalid_combination'
      render 'new' and return
    end

    login_student student
    logout_admin
    logout_teacher
    redirect_to student
  end

  def destroy
    logout_student
    redirect_to login_path
  end

  def prevent_duplicated
    redirect_to current_student if current_student
  end

end

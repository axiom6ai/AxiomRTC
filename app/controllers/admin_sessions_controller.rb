class AdminSessionsController < ApplicationController

  before_action :prevent_duplicated, except: [:destroy]

  def new
  end

  def create
    admin = Admin.find_by_mobile params[:session][:mobile]
    unless admin && admin.authenticate(params[:session][:password])
      flash.now[:alert] = t 'sessions.invalid_combination'
      render 'new' and return
    end

    login_admin admin
    logout_teacher
    logout_student
    redirect_to admin
  end

  def destroy
    logout_admin
    redirect_to new_admin_sessions_path
  end

  def prevent_duplicated
    redirect_to current_admin if current_admin
  end

end

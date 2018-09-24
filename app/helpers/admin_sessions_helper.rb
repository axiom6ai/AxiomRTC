module AdminSessionsHelper

  def login_admin(admin)
    session[:admin] = admin.mobile
    @current_admin = admin
  end

  def logout_admin
    session.delete :admin
    @current_admin = nil
  end

  def current_admin
    return @current_admin if @current_admin
    mobile = session[:admin]
    return nil unless mobile
    @current_admin = Admin.find_by_mobile mobile
  end

end

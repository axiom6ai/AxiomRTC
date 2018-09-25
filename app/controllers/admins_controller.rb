class AdminsController < ApplicationController
  before_action :logged_in_admin
  before_action :set_admin, only: [:show, :edit, :update]
  before_action :only_self_or_root, only: [:edit, :update]
  before_action :only_root, only: [:new, :create]

  # GET /admins
  def index
    if params[:mobile] && !params[:mobile].empty?
      @admins = Admin.where(mobile: params[:mobile].strip).paginate(
          page: params[:page], per_page: 10)
    else
      @admins = Admin.all.paginate page: params[:page], per_page: 10
    end
  end

  # GET /admins/:mobile
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/:mobile/edit
  def edit
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to @admin, notice: t('creating_success')
    else
      render :new, alert: t('creating_failed')
    end
  end

  # PATCH/PUT /admins/:mobile
  def update
    if @admin.update(admin_params)
      redirect_to @admin, notice: t('updating_success')
    else
      render :edit, alert: t('updating_failed')
    end
  end

  # DELETE /admins/:mobile
  def destroy
    @admin.destroy
    redirect_to admins_path, notice: t('deleting_success')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    return nil unless params[:admin]
    params[:admin].delete :level unless current_admin.root?
    # Do not allow creating root directly
    params[:admin][:level] = Admin::NORMAL if params[:admin][:level] == Admin::ROOT
    # Ignore :level
    params.require(:admin).permit(:name, :mobile, :password, :password_confirmation)
  end

  def only_self_or_root
    redirect_back fallback_location: root_path, alert: t('no_privilege') unless
        @admin.mobile == current_admin.mobile || current_admin.root?
  end

  def only_root
    redirect_back fallback_location: root_path, alert: t('no_privilege') unless
        current_admin.root?
  end

end

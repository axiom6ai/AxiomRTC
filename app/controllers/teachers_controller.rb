class TeachersController < ApplicationController
  before_action :logged_in_admin, expect: [:show, :edit, :update]
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :only_self, only: [:edit, :update], unless: :current_admin
  before_action :only_self_or_own_student, only: [:show], unless: :current_admin

  # GET /teachers
  # GET /teachers.json
  def index
    if params[:mobile] && !params[:mobile].empty?
      @teachers = Teacher.where(mobile: params[:mobile].strip).paginate(
          page: params[:page], per_page: 10)
    else
      @teachers = Teacher.all.paginate page: params[:page], per_page: 10
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html {redirect_to @teacher, notice: t('creating_success')}
        format.json {render :show, status: :created, location: @teacher}
      else
        format.html {render :new, alert: t('creating_failed')}
        format.json {render json: @teacher.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html {redirect_to @teacher, notice: t('updating_success')}
        format.json {render :show, status: :ok, location: @teacher}
      else
        format.html {render :edit, alert: t('updating_failed')}
        format.json {render json: @teacher.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html {redirect_to teachers_url, notice: t('deleting_success')}
      format.json {head :no_content}
    end
  end

  private


  def only_self_or_own_student
    if current_student
      redirect_back fallback_location: root_path, alert: t('no_privilege') unless
          current_student.teacher_id == @teacher.id
    else
      redirect_back fallback_location: root_path, alert: t('no_privilege') unless
          current_teacher && current_teacher.id == @teacher.id
    end
  end

  def only_self
    redirect_back fallback_location: root_path, alert: t('no_privilege') unless
        current_teacher && current_teacher.id == @teacher.id
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def teacher_params
    params.require(:teacher).permit(:mobile, :name, :degree, :password, :password_confirmation)
  end
end

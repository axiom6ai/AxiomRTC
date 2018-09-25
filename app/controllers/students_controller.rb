class StudentsController < ApplicationController
  before_action :logged_in, except: [:new, :create]
  before_action :logged_in_admin, only: [:destroy]
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :only_self, only: [:edit, :update], unless: :current_admin
  before_action :only_self_or_own_teacher, only: [:show], unless: :current_admin

  # GET /students
  # GET /students.json
  def index
    if params[:mobile] && !params[:mobile].empty?
      @students = Student.where(mobile: params[:mobile].strip).paginate(
          page: params[:page], per_page: 10)
    else
      @students = Student.all.paginate page: params[:page], per_page: 10
    end
  end

  # GET /students/:id
  # GET /students/:id.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html {redirect_to @student, notice: t('creating_success')}
        format.json {render :show, status: :created, location: @student}
      else
        format.html {render :new, alert: t('creating_failed')}
        format.json {render json: @student.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html {redirect_to @student, notice: t('updating_success')}
        format.json {render :show, status: :ok, location: @student}
      else
        format.html {render :edit, alert: t('updating_failed')}
        format.json {render json: @student.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html {redirect_to students_path, notice: t('deleting_success')}
      format.json {head :no_content}
    end
  end

  private

  def only_self_or_own_teacher
    if current_teacher
      redirect_back fallback_location: root_path, alert: t('no_privilege') unless
          current_teacher.id == @student.teacher_id
    else
      redirect_back fallback_location: root_path, alert: t('no_privilege') unless
          current_student && current_student.id == @student.id
    end
  end

  def only_self
    redirect_back fallback_location: root_path, alert: t('no_privilege') unless
        current_student && current_student.id == @student.id
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.fetch(:student, {})
  end
end

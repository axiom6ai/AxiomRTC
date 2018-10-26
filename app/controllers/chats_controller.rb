class ChatsController < ApplicationController
  before_action :logged_in
  before_action :set_chat, only: [:show]

  # GET /chats
  def index
    if current_student
      @chats = current_student.chats
    elsif current_teacher
      @chats = current_teacher.chats
    else
      if (mobile = params[:mobile])
        @chats = []
        student = Student.find_by_mobile mobile
        @chats += student.chats if student
        teacher = Teacher.find_by_mobile mobile
        @chats += teacher.chats if teacher
        admin = Admin.find_by_mobile mobile
        @chats += admin.chats if admin
      else
        @chats = Chat.all
      end
    end
  end

  # GET /chats/new
  def new
    @chat = Chat.new name: 'Coding'
    if @chat.save
      @app_id = '6c503009f94f42459ffa73cbd8a4c7de'
      @local_uid = if current_admin
                     current_admin.mobile % 100000
                   elsif current_teacher
                     current_teacher.id
                   elsif current_student
                     current_student.id
                   end
    else

    end
  end

  # GET /chats/:id
  def show

  end

  private

  def check_privilege
    redirect_back fallback_location: root_path, alert: t('no_privilege') unless current_admin ||
        (current_teacher && current_teacher.id == @chat.teacher_id) ||
        (current_student && current_student.id == @chat.student_id)
  end

  def set_chat
    @chat = Chat.find(params[:id])
    check_privilege
  end

  def chat_params
    @chat_params = params.require(:chat).permit(:name)
  end

end

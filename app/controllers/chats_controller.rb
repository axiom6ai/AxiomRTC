class ChatsController < ApplicationController
  before_action :logged_in
  before_action :set_chat, only: [:show, :update]

  # GET /chats
  def index
    if current_student
      current_student.chats
    elsif current_teacher
      current_teacher.chats
    else
      Chat.all
    end
  end

  # GET /chats/new
  def new
    @app_id = '6c503009f94f42459ffa73cbd8a4c7de'
    @local_uid = if current_admin
                   current_admin.mobile % 100000
                 elsif current_teacher
                   current_teacher.id
                 elsif current_student
                   current_student.id
                 end
    @chat = Chat.new name: '1000'
  end

  # POST /chats.json
  # POST /chats.js
  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        format.json {head :ok}
      else
        format.js {logger.error "chats#create: #{@chat.errors}"}
        format.json {render json: @chat.errors, status: :unprocessable_entity}
      end
    end
  end

  # GET /chats/:id
  def show

  end

  # PUT /chats/:id.json
  # PUT /chats/:id.js
  def update
    respond_to do |format|
      if @chat.update chat_params
        format.json {head :ok}
      else
        format.js {logger.error "chats#update: #{@chat.errors}"}
        format.json {render json: @chat.errors, status: :unprocessable_entity}
      end
    end
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
    @chat_params = params.fetch :chat, {}
  end

end

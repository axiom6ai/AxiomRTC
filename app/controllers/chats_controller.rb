class ChatsController < ApplicationController
  before_action :logged_in
  before_action :set_chat, only: [:show, :update]

  layout false, only: [:new]

  # GET /chats
  def index
    filter = {}
    filter[:teacher_mobile] = current_teacher.mobile if current_teacher
    filter[:student_mobile] = current_student.mobile if current_student

    if chat_params[:quest] && !chat_params[:quest].empty?
      chat_params[:quest].scan /((\w+)?\s+(\d+))/ do |x, y, z|
        case y
        when /teacher/
          filter[:teacher_mobile] = z unless current_teacher
        when /student/
          filter[:student_mobile] = z unless current_student
        end
      end
    end

    if filter[:teacher_mobile] || filter[:student_mobile]
      @tickets = Chat.where(filter).paginate(page: params[:page], per_page: 10)
    else
      @tickets = Chat.all.paginate(page: params[:page], per_page: 10)
    end

  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # POST /chats.json
  # POST /chats.js
  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        format.json {head :ok}
      else
        format.js {logger.error "chats#create: #{@chat.errors}" }
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
        format.json{head :ok}
      else
        format.js {logger.error "chats#update: #{@chat.errors}" }
        format.json {render json: @chat.errors, status: :unprocessable_entity}
      end
    end
  end


  private

  def check_privilege
    redirect_back fallback_location: root_path, alert: t('no_privilege') unless
        current_admin ||
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

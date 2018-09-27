class TeacherChattingsController < ApplicationController
  before_action :set_teacher_chatting, only: [:destroy]

  # POST /teacher_chattings.json
  def create
    @teacher_chatting = TeacherChatting.new(teacher_chatting_params)
    @teacher_chatting.start_at = DateTime.now
    @teacher_chatting.end_at = @teacher_chatting.start_at + 1.minute

    if @teacher_chatting.save
      render json: {id: @teacher_chatting.id}, status: :ok
    else
      render json: @teacher_chatting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teacher_chattings/1.json
  def destroy
    @teacher_chatting.update! end_at: DateTime.now + 1.minute
    render json: {}, status: :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_teacher_chatting
    @teacher_chatting = TeacherChatting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def teacher_chatting_params
    params.require(:teacher_chatting).permit(:teacher_id, :chat_id)
  end

end

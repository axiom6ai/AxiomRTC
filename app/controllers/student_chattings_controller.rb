class StudentChattingsController < ApplicationController
  before_action :set_student_chatting, only: [:destroy]

  # POST /student_chattings.json
  def create
    @student_chatting = StudentChatting.new(student_chatting_params)
    @student_chatting.start_at = DateTime.now
    @student_chatting.start_at = @student_chatting.start_at + 1.minute

    if @student_chatting.save
      render json: {id: @student_chatting.id}, status: :ok
    else
      render json: @student_chatting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /student_chattings/1.json
  def destroy
    @student_chatting.update! end_at: DateTime.now + 1.minute
    render json: {}, status: :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student_chatting
    @student_chatting = StudentChatting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_chatting_params
    params.require(:student_chatting).permit(:student_id, :chat_id)
  end

end

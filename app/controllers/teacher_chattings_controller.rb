class TeacherChattingsController < ApplicationController
  before_action :set_teacher_chatting, only: [:destroy]

  # POST /teacher_chattings.json
  # POST /teacher_chattings.js
  def create
    @teacher_chatting = TeacherChatting.new(teacher_chatting_params)
    @teacher_chatting.start_at = DateTime.now

    respond_to do |format|
      if @teacher_chatting.save
        format.json { render :show, status: :created, location: @teacher_chatting }
        format.js{}
      else
        format.json { render json: @teacher_chatting.errors, status: :unprocessable_entity }
        format.js{}
      end
    end
  end

  # DELETE /teacher_chattings/1.json
  # DELETE /teacher_chattings/1.js
  def destroy
    @teacher_chatting.end_at = DateTime.now
    respond_to do |format|
      format.json { head :no_content }
      format.js {}
    end
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

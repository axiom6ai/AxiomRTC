class StudentChattingsController < ApplicationController
  before_action :set_student_chatting, only: [:destroy]

  # POST /student_chattings.json
  # POST /student_chattings.js
  def create
    @student_chatting = StudentChatting.new(student_chatting_params)
    @student_chatting.start_at = DateTime.now

    respond_to do |format|
      if @student_chatting.save
        format.json { render :show, status: :created, location: @student_chatting }
        format.js{}
      else
        format.json { render json: @student_chatting.errors, status: :unprocessable_entity }
        format.js{}
      end
    end
  end

  # DELETE /student_chattings/1.json
  # DELETE /student_chattings/1.js
  def destroy
    @student_chatting.end_at = DateTime.now
    respond_to do |format|
      format.json { head :no_content }
      format.js {}
    end
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

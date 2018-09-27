class AdminChattingsController < ApplicationController
  before_action :set_admin_chatting, only: [:destroy]

  # POST /admin_chattings.json
  def create
    @admin_chatting = AdminChatting.new(admin_chatting_params)
    @admin_chatting.start_at = DateTime.now
    @admin_chatting.end_at = @admin_chatting.start_at + 1.minute

    if @admin_chatting.save
      render json: {id: @admin_chatting.id}, status: :ok
    else
      render json: @admin_chatting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin_chattings/1.json
  def destroy
    @admin_chatting.update! end_at: DateTime.now + 1.minute
    render json: {}, status: :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_chatting
    @admin_chatting = AdminChatting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_chatting_params
    params.require(:admin_chatting).permit(:admin_id, :chat_id)
  end

end

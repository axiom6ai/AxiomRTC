class AdminChattingsController < ApplicationController
  before_action :set_admin_chatting, only: [:destroy]

  # POST /admin_chattings.json
  # POST /admin_chattings.js
  def create
    @admin_chatting = AdminChatting.new(admin_chatting_params)
    @admin_chatting.start_at = DateTime.now

    respond_to do |format|
      if @admin_chatting.save
        format.json { render :show, status: :created, location: @admin_chatting }
        format.js{}
      else
        format.json { render json: @admin_chatting.errors, status: :unprocessable_entity }
        format.js{}
      end
    end
  end

  # DELETE /admin_chattings/1.json
  # DELETE /admin_chattings/1.js
  def destroy
    @admin_chatting.end_at = DateTime.now
    respond_to do |format|
      format.json { head :no_content }
      format.js {}
    end
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

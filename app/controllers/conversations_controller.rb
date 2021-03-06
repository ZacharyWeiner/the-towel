class ConversationsController < ApplicationController
 before_action :authenticate_user!
 layout 'admin'
  def index
    @users = User.where(organization: current_user.organization)
    @conversations = Conversation.where(recipient: current_user).or(Conversation.where(sender_id: current_user.id))
  end
  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],
      params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_emails_path(@conversation)
  end
private
 def conversation_params
  params.permit(:sender_id, :recipient_id)
 end
end

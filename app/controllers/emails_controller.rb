class EmailsController < ApplicationController
  layout 'admin'
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @emails = @conversation.emails
    if @emails.length > 10
      @over_ten = true
      @emails = @emails[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @emails = @conversation.emails
    end
    if @emails.last
      if @emails.last.user_id != current_user.id
        @emails.last.read = true;
        @emails.last.save
      end
    end
    @email = @conversation.emails.new
  end

  def new
    @email = @conversation.emails.new
  end

  def create
    @email = @conversation.emails.new(email_params)
    if @email.save
      redirect_to conversation_emails_path(@conversation)
    end
  end

  private
  def email_params
  params.require(:email).permit(:body, :user_id)
  end
end

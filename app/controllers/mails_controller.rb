class MailsController < ApplicationController
  layout 'admin'
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @mails = @conversation.mails
    if @mails.length > 10
      @over_ten = true
      @mails = @mails[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @mails = @conversation.mails
    end
    if @mails.last
      if @mails.last.user_id != current_user.id
        @mails.last.read = true;
        @mails.last.save
      end
    end
    @mail = @conversation.mails.new
  end

  def new
    @mail = @conversation.mails.new
  end

  def create
    @mail = @conversation.mails.new(mail_params)
    if @mail.save
      redirect_to conversation_mails_path(@conversation)
    end
  end

  private
  def mail_params
  params.require(:mail).permit(:body, :user_id)
  end
end

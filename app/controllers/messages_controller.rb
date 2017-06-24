class MessagesController < ApplicationController
  before_action :update_read_message, only: [:show]

  def index
    if params[:type] == "INBOX"
      @message = current_user.received_messages
    elsif params[:type] == "SENT"
      @message = current_user.sent_messages
    elsif params[:type] == "UNREAD"
      @message = current_user.unread_messages
    end
  end

  def new
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    byebug
    @message = Message.new(message_params)
    update_sender_id
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_read_message
    m = Message.find(params[:id])
    m[:read_status] = true
    m[:read_at] = Time.now
    m.save!
  end

  private

  def update_sender_id
    @message[:sender_id] = current_user.id
    @message.save!
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:title, :body, :email, :sender_id, :recipient_id, :read_status, :read_at)
  end
end

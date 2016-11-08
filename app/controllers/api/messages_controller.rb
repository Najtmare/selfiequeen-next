class Api::MessagesController < Api::ApiController
  before_action :authenticate_user!
  before_action :find_message, only: [:update, :show, :destroy]
  before_action :find_conversation, only: [:create]
  after_action  :verify_authorized, only: [:update, :destroy]

  def index
  end

  def show
  end

  def create
    @message = @conversation.messages.new(message_params)

    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @message

    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @message

    @message.destroy
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id, :conversation_id)
  end
end
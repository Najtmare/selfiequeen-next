class Api::ConversationsController < Api::ApiController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:show, :update, :destroy]
  after_action  :verify_authorized, only: [:update, :destroy]

  # GET /conversations
  def index
    @conversations = Conversation.all

    render json: @conversations
  end

  # GET /conversations/1
  def show
    render json: @conversation
  end

  # POST /conversations
  def create
    @conversation = Conversation.find_or_create_by(conversation_params)

    if @conversation.save
      render json: @conversation, status: :created, location: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conversations/1
  def update
    authorize @conversation

    if @conversation.update(conversation_params)
      render json: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conversations/1
  def destroy
    authorize @conversation

    @conversation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def conversation_params
      params.require(:conversation).permit(:sender_id, :recipient_id)
    end
end
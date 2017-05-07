class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]


  # GET /messages
  # GET /messages.json
# define messages for message
  def index
    @messages = Message.all
  end
  
  # GET /messages/1
  # GET /messages/1.json
# This is for showing messages
  def show
    #@message = Message.find(params[:id])
  end

  # GET /messages/new
# This is for creating a new message
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
# This is for editing a message
  def edit
  end

  # POST /messages
  # POST /messages.json
# This is for creating a new message and if the new message is saved 
# give a note after successfully creating and saving the message
  def create
    @message = Message.new(message_params)

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

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
# This is for updating a message and give a note after sucessfully upating the 
# message
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
# This is for destorying a message and give a note after 
# successfully destrying the message.
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
# define set_message for searching
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end
# define message_params for searching
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:author, :subject, :content, :tag_list)
    end

# define search and products for searching
  # Used for Ransack gem User field searching

  def index
    @search = Message.search(params[:q])
    @products = @search.result
  end
  
    def index
      @search = Message.search(params[:q])
      @products = @search.result
    end
  
end

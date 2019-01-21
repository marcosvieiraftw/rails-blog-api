class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /comments
  def index
    @comments = Comment.all
    render json: CommentSerializer.new(@comments).serialized_json
  end

  # GET /comments/1
  def show
    render json: CommentSerializer.new(@comment).serialized_json
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      render json: CommentSerializer.new(@comment).serialized_json, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    @comment.user_id = current_user.id

    if @comment.update(comment_params)
      render json: CommentSerializer.new(@comment).serialized_json
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.soft_delete!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:post_id, :description)
    end
end

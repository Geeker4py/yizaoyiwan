class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.discussion = @discussion
    @comment.user = current_user
    @comment.save

    redirect_to discussion_path(@discussion)
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end

    def comment_params
      params.require(:comment).permit(:content, :discussion_id, :user_id, :parser)
    end
end

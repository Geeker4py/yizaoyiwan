class DiscussionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_discussion, only: [:show, :edit, :update, :bookmark :destroy]

  respond_to :html

  def index
    @discussions = Discussion.includes(:last_comment_user)
                             .order(updated_at: :desc)
                             .paginate(page: params[:page])

    respond_with(@discussions)
  end

  def show
    @comments = @discussion.comments
    @comment  = Comment.new
    respond_with(@discussion)
  end

  def new
    @discussion = Discussion.new
    respond_with(@discussion)
  end

  def edit
  end

  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.user_id = current_user.id
    @discussion.save
    respond_with(@discussion)
  end

  def update
    @discussion.user_id = current_user.id
    @discussion.update(discussion_params)
    respond_with(@discussion)
  end

  def bookmark
    @discussion.vote_by(voter: current_user, vote: 'bookmark')

    flash[:success] = '已添加到收藏'
    redirect_to @bookmark
  end

  def destroy
    @discussion.destroy
    respond_with(@discussion)
  end

  private
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    def discussion_params
      params.require(:discussion).permit(:title, :content, :user_id, :category_id, :parser)
    end
end

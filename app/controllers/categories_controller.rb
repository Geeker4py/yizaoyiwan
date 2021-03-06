class CategoriesController < ApplicationController
  respond_to :html

  def show
    @category = Category.find_by(slug: params[:slug]);
    @discussions = @category.discussions
                            .includes(:last_comment_user)
                            .order(updated_at: :desc)
                            .paginate(page: params[:page])

    respond_with(@category, @discussions)
  end
end

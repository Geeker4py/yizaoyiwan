module DiscussionsHelper
  def render_comment_content(comment)
    if comment.deleted?
      simple_format('<del>该条评论已删除</del>')
    else
      simple_format(comment.content)
    end
  end
end

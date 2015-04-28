module DiscussionsHelper
  def render_comment_content(comment)
    if comment.deleted?
      simple_format('<del>该条评论已删除</del>')
    else
      simple_format(comment.content)
    end
  end

  def render_discussion_bookmark_link(discussion)
    if current_user.voted_on?(discussion, vote_scope: 'bookmark')
      link_to '取消收藏', [:bookmark, discussion], method: :patch
    else
      link_to '收藏', [:bookmark, discussion], method: :patch
    end
  end

end

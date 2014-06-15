module PostHelper
  def get_posts(category)
    category.posts
  end

  def get_post_titles(category)
    posts = get_posts(category)
    post_title = posts.map { |post| post.title }
  end
end